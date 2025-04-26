//
//  LoadingButton.swift
//  ButtonsKit
//
//  Created by ceviixx on 27.04.25.
//

import SwiftUI

public struct LoadingButton<Label: View, Style: ButtonStyle>: View {
    let action: () -> Void
    let isLoading: Bool
    let label: () -> Label
    let style: Style

    public init(
        isLoading: Bool,
        style: Style,
        action: @escaping () -> Void,
        @ViewBuilder label: @escaping () -> Label
    ) {
        self.isLoading = isLoading
        self.style = style
        self.action = action
        self.label = label
    }

    public var body: some View {
        Button(action: {
            if !isLoading {
                action()
            }
        }) {
            ZStack {
                label()
                    .opacity(isLoading ? 0 : 1)

                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                }
            }
        }
        .buttonStyle(style)
        .disabled(isLoading)
    }
}

public struct AnyButtonStyle: ButtonStyle {
    private let _makeBody: (Configuration) -> AnyView

    public init<S: ButtonStyle>(_ style: S) {
        _makeBody = { config in AnyView(style.makeBody(configuration: config)) }
    }

    public func makeBody(configuration: Configuration) -> some View {
        _makeBody(configuration)
    }
}
