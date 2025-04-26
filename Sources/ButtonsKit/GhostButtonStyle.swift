//
//  GhostButtonStyle.swift
//  ButtonsKit
//
//  Created by ceviixx on 27.04.25.
//

import SwiftUI

public struct GhostButtonStyle: ButtonStyle {
    let foregroundColor: Color
    let pressedBackground: Color
    let cornerRadius: CGFloat
    let font: Font?
    let pressedOpacity: Double

    public init(
        foregroundColor: Color = .accentColor,
        pressedBackground: Color = Color.accentColor.opacity(0.1),
        cornerRadius: CGFloat = 8,
        pressedOpacity: Double = 1.0,
        font: Font? = nil
    ) {
        self.foregroundColor = foregroundColor
        self.pressedBackground = pressedBackground
        self.cornerRadius = cornerRadius
        self.font = font
        self.pressedOpacity = pressedOpacity
    }

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(font ?? .system(.body, weight: .regular))
            .foregroundColor(foregroundColor)
            .padding(.vertical, 8)
            .padding(.horizontal, 12)
            .background(
                configuration.isPressed
                ? pressedBackground.opacity(pressedOpacity)
                : Color.clear
            )
            .cornerRadius(cornerRadius)
            .animation(.easeInOut(duration: 0.15), value: configuration.isPressed)
    }
}

public extension View {
    func ghostButtonStyle(
        foregroundColor: Color = .accentColor,
        pressedBackground: Color = Color.accentColor.opacity(0.1),
        cornerRadius: CGFloat = 8,
        pressedOpacity: Double = 1.0,
        font: Font? = nil
    ) -> some View {
        self.buttonStyle(
            GhostButtonStyle(
                foregroundColor: foregroundColor,
                pressedBackground: pressedBackground,
                cornerRadius: cornerRadius,
                pressedOpacity: pressedOpacity,
                font: font
            )
        )
    }
}
