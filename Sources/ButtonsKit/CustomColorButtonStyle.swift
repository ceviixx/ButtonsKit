//
//  CustomColorButtonStyle.swift
//  ButtonsKit
//
//  Created by ceviixx on 27.04.25.
//

import SwiftUI

public struct CustomColorButtonStyle: ButtonStyle {
    let backgroundColor: Color
    let foregroundColor: Color
    let pressedOpacity: Double
    let cornerRadius: CGFloat
    let borderColor: Color?
    let borderWidth: CGFloat
    let shadowColor: Color?
    let shadowRadius: CGFloat
    let font: Font?
    let isDisabled: Bool

    public init(
        backgroundColor: Color,
        foregroundColor: Color,
        pressedOpacity: Double = 0.7,
        cornerRadius: CGFloat = 10,
        borderColor: Color? = nil,
        borderWidth: CGFloat = 1,
        shadowColor: Color? = nil,
        shadowRadius: CGFloat = 0,
        font: Font? = nil,
        isDisabled: Bool = false
    ) {
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.pressedOpacity = pressedOpacity
        self.cornerRadius = cornerRadius
        self.borderColor = borderColor
        self.borderWidth = borderWidth
        self.shadowColor = shadowColor
        self.shadowRadius = shadowRadius
        self.font = font
        self.isDisabled = isDisabled
    }

    public func makeBody(configuration: Configuration) -> some View {
        let effectiveOpacity = configuration.isPressed && !isDisabled ? pressedOpacity : 1

        return configuration.label
            .font(font ?? .system(.body, weight: .semibold))
            .foregroundColor(foregroundColor)
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                backgroundColor
                    .opacity(isDisabled ? 0.4 : effectiveOpacity)
            )
            .cornerRadius(cornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(borderColor ?? .clear, lineWidth: borderColor != nil ? borderWidth : 0)
            )
            .shadow(
                color: (shadowColor ?? .clear).opacity(isDisabled ? 0 : 1),
                radius: shadowRadius
            )
            .animation(.easeInOut(duration: 0.2), value: configuration.isPressed)
    }
}

public extension View {
    func customColorButtonStyle(
        backgroundColor: Color,
        foregroundColor: Color,
        pressedOpacity: Double = 0.7,
        cornerRadius: CGFloat = 10,
        borderColor: Color? = nil,
        borderWidth: CGFloat = 1,
        shadowColor: Color? = nil,
        shadowRadius: CGFloat = 0,
        font: Font? = nil,
        isDisabled: Bool = false
    ) -> some View {
        self.buttonStyle(
            CustomColorButtonStyle(
                backgroundColor: backgroundColor,
                foregroundColor: foregroundColor,
                pressedOpacity: pressedOpacity,
                cornerRadius: cornerRadius,
                borderColor: borderColor,
                borderWidth: borderWidth,
                shadowColor: shadowColor,
                shadowRadius: shadowRadius,
                font: font,
                isDisabled: isDisabled
            )
        )
        .disabled(isDisabled)
    }
}
