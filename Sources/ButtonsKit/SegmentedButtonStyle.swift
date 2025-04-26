//
//  SegmentedButtonStyle.swift
//  ButtonsKit
//
//  Created by ceviixx on 27.04.25.
//

import SwiftUI

public struct SegmentedButtonStyle: ButtonStyle {
    let isSelected: Bool
    let selectedBackground: Color
    let unselectedBackground: Color
    let selectedForeground: Color
    let unselectedForeground: Color
    let cornerRadius: CGFloat
    let font: Font?
    let selectedBorderColor: Color?
    let borderWidth: CGFloat

    public init(
        isSelected: Bool,
        selectedBackground: Color = .accentColor,
        unselectedBackground: Color = .clear,
        selectedForeground: Color = .white,
        unselectedForeground: Color = .accentColor,
        cornerRadius: CGFloat = 8,
        font: Font? = nil,
        selectedBorderColor: Color? = nil,
        borderWidth: CGFloat = 1
    ) {
        self.isSelected = isSelected
        self.selectedBackground = selectedBackground
        self.unselectedBackground = unselectedBackground
        self.selectedForeground = selectedForeground
        self.unselectedForeground = unselectedForeground
        self.cornerRadius = cornerRadius
        self.font = font
        self.selectedBorderColor = selectedBorderColor
        self.borderWidth = borderWidth
    }

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(font ?? .system(.callout, weight: .medium))
            .foregroundColor(isSelected ? selectedForeground : unselectedForeground)
            .padding(.vertical, 8)
            .padding(.horizontal, 16)
            .background(
                (isSelected ? selectedBackground : unselectedBackground)
                    .opacity(configuration.isPressed ? 0.8 : 1)
            )
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(
                        selectedBorderColor ?? .clear,
                        lineWidth: isSelected ? borderWidth : 0
                    )
            )
            .cornerRadius(cornerRadius)
            .animation(.easeInOut(duration: 0.15), value: configuration.isPressed)
    }
}

public extension View {
    func segmentedButtonStyle(
        isSelected: Bool,
        selectedBackground: Color = .accentColor,
        unselectedBackground: Color = .clear,
        selectedForeground: Color = .white,
        unselectedForeground: Color = .accentColor,
        cornerRadius: CGFloat = 8,
        font: Font? = nil,
        selectedBorderColor: Color? = nil,
        borderWidth: CGFloat = 1
    ) -> some View {
        self.buttonStyle(
            SegmentedButtonStyle(
                isSelected: isSelected,
                selectedBackground: selectedBackground,
                unselectedBackground: unselectedBackground,
                selectedForeground: selectedForeground,
                unselectedForeground: unselectedForeground,
                cornerRadius: cornerRadius,
                font: font,
                selectedBorderColor: selectedBorderColor,
                borderWidth: borderWidth
            )
        )
    }
}
