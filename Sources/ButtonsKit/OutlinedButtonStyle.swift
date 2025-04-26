//
//  OutlinedButtonStyle.swift
//  ButtonsKit
//
//  Created by ceviixx on 27.04.25.
//

import SwiftUI

public struct OutlinedButtonStyle: ButtonStyle {
    let borderColor: Color
    let foregroundColor: Color
    let borderWidth: CGFloat
    let cornerRadius: CGFloat
    let pressedOpacity: Double
    let font: Font?

    public init(
        borderColor: Color = .accentColor,
        foregroundColor: Color = .accentColor,
        borderWidth: CGFloat = 1,
        cornerRadius: CGFloat = 10,
        pressedOpacity: Double = 0.4,
        font: Font? = nil
    ) {
        self.borderColor = borderColor
        self.foregroundColor = foregroundColor
        self.borderWidth = borderWidth
        self.cornerRadius = cornerRadius
        self.pressedOpacity = pressedOpacity
        self.font = font
    }

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(font ?? .system(.body, weight: .medium))
            .foregroundColor(foregroundColor)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.clear)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(borderColor.opacity(configuration.isPressed ? pressedOpacity : 1), lineWidth: borderWidth)
            )
            .cornerRadius(cornerRadius)
            .animation(.easeInOut(duration: 0.2), value: configuration.isPressed)
    }
}

public extension View {
    func outlinedButtonStyle(
        borderColor: Color = .accentColor,
        foregroundColor: Color = .accentColor,
        borderWidth: CGFloat = 1,
        cornerRadius: CGFloat = 10,
        pressedOpacity: Double = 0.4,
        font: Font? = nil
    ) -> some View {
        self.buttonStyle(
            OutlinedButtonStyle(
                borderColor: borderColor,
                foregroundColor: foregroundColor,
                borderWidth: borderWidth,
                cornerRadius: cornerRadius,
                pressedOpacity: pressedOpacity,
                font: font
            )
        )
    }
}
