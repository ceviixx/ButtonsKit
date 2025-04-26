//
//  SwiftUIView.swift
//  ButtonsKit
//
//  Created by ceviixx on 27.04.25.
//

import SwiftUI

struct ButtonsKitPreviewView: View {
    @State private var isLoading = false
    @State private var isToggled = false
    @State private var isSelected = true
    @State private var selectedSegment = 0
    @State private var isChipSelected = true

    init() {}

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 32) {

                    SectionView(title: "Standard Styles") {
                        Button("Primary") { }.primaryButtonStyle()
                        Button("Secondary") { }.secondaryButtonStyle()
                        Button("Destructive") { }.destructiveButtonStyle()
                        Button("Disabled") { }.disabledButtonStyle().disabled(true)
                    }

                    SectionView(title: "Custom & Flexible") {
                        Button("Custom Color") { }
                            .customColorButtonStyle(
                                backgroundColor: .orange,
                                foregroundColor: .white,
                                borderColor: .white,
                                shadowColor: .orange,
                                shadowRadius: 4
                            )
                        Button("Styled Background (Material)") { }
                            .styledButtonStyle(
                                background: .ultraThinMaterial,
                                foregroundColor: .primary
                            )
                    }

                    SectionView(title: "Gradients") {
                        Button("Linear") { }
                            .linearGradientButtonStyle(gradient: Gradient(colors: [.blue, .purple]))
                        Button("Radial") { }
                            .radialGradientButtonStyle(gradient: Gradient(colors: [.pink, .red]))
                        Button("Angular") { }
                            .angularGradientButtonStyle(gradient: Gradient(colors: [.yellow, .orange, .pink, .yellow]))
                    }

                    SectionView(title: "Ghost & Outline") {
                        Button("Ghost") { }.ghostButtonStyle()
                        Button("Capsule Ghost") { }.capsuleGhostButtonStyle(isSelected: isChipSelected)
                        Button("Outlined") { }
                            .outlinedButtonStyle(borderColor: .purple, foregroundColor: .purple)
                    }

                    SectionView(title: "Pill, Toggle, Icon, Labeled") {
                        Button("Pill") { }
                            .pillButtonStyle(isSelected: isChipSelected)

                        Button(action: { isToggled.toggle() }) {
                            Text(isToggled ? "On" : "Off")
                        }
                        .toggleButtonStyle(isOn: isToggled)

                        Button(action: {
                            isChipSelected.toggle()
                        }) {
                            Label("Favorit", systemImage: isChipSelected ? "heart.fill" : "heart")
                        }
                        .pillButtonStyle(isSelected: isChipSelected)

                        Button(action: { }) {
                            Image(systemName: "gear")
                        }
                        .iconButtonStyle()

                        Button(action: { }) {
                            Label("Settings", systemImage: "gear")
                        }
                        .labeledIconButtonStyle()
                    }

                    SectionView(title: "Toolbar & Segmented") {
                        HStack(spacing: 16) {
                            Button { } label: {
                                Image(systemName: "chevron.left")
                            }.toolbarButtonStyle()

                            Button { } label: {
                                Image(systemName: "xmark")
                            }.toolbarButtonStyle(
                                backgroundColor: .red.opacity(0.2),
                                foregroundColor: .red
                            )
                        }

                        HStack(spacing: 0) {
                            ForEach(0..<3) { i in
                                Button(["All", "Favorites", "Archived"][i]) {
                                    selectedSegment = i
                                }
                                .segmentedButtonStyle(isSelected: selectedSegment == i)
                            }
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    }

                    SectionView(title: "Loading Button") {
                        LoadingButton(
                            isLoading: isLoading,
                            style: PrimaryButtonStyle()
                        ) {
                            // try? await Task.sleep(nanoseconds: 2_000_000_000)
                        } label: {
                            Text("Send")
                        }
                    }

                    SectionView(title: "Toggle Chip Button") {
                        ToggleChipButton(isSelected: $isChipSelected) {
                            Label("Filter: Active", systemImage: "line.horizontal.3.decrease.circle")
                        }
                    }

                    Spacer()
                }
                .padding()
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("ButtonsKit")
        }
    }
}

struct ButtonsKitPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsKitPreviewView()
    }
}



struct SectionView<Content: View>: View {
    let title: String
    let content: () -> Content

    init(title: String, @ViewBuilder content: @escaping () -> Content) {
        self.title = title
        self.content = content
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.title3)
                .fontWeight(.semibold)
                .padding(.bottom, 4)

            content()
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.secondarySystemGroupedBackground))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.05), radius: 2, x: 0, y: 1)
    }
}
