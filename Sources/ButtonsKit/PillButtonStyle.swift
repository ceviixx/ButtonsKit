//
//  PillButtonStyle.swift
//  ButtonsKit
//
//  Created by ceviixx on 27.04.25.
//

import SwiftUI

public struct PillButtonStyle: ButtonStyle {
    let backgroundColor: Color
    let foregroundColor: Color
    let borderColor: Color?
    let borderWidth: CGFloat
    let font: Font?
    let pressedOpacity: Double
    let isSelected: Bool?
    let selectedBackgroundColor: Color?

    public init(
        backgroundColor: Color = .gray.opacity(0.2),
        foregroundColor: Color = .primary,
        borderColor: Color? = nil,
        borderWidth: CGFloat = 1,
        font: Font? = nil,
        pressedOpacity: Double = 0.7,
        isSelected: Bool? = nil,
        selectedBackgroundColor: Color? = nil
    ) {
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.borderColor = borderColor
        self.borderWidth = borderWidth
        self.font = font
        self.pressedOpacity = pressedOpacity
        self.isSelected = isSelected
        self.selectedBackgroundColor = selectedBackgroundColor
    }

    public func makeBody(configuration: Configuration) -> some View {
        let resolvedBackground = {
            if let isSelected = isSelected, isSelected {
                return (selectedBackgroundColor ?? backgroundColor)
            }
            if configuration.isPressed {
                return backgroundColor.opacity(pressedOpacity)
            }
            return backgroundColor
        }()

        return configuration.label
            .font(font ?? .system(.callout, weight: .medium))
            .foregroundColor(foregroundColor)
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(resolvedBackground)
            .overlay(
                Capsule().stroke(borderColor ?? .clear, lineWidth: borderColor != nil ? borderWidth : 0)
            )
            .clipShape(Capsule())
            .animation(.easeInOut(duration: 0.15), value: configuration.isPressed)
    }
}

public extension View {
    func pillButtonStyle(
        backgroundColor: Color = .gray.opacity(0.2),
        foregroundColor: Color = .primary,
        borderColor: Color? = nil,
        borderWidth: CGFloat = 1,
        font: Font? = nil,
        pressedOpacity: Double = 0.7,
        isSelected: Bool? = nil,
        selectedBackgroundColor: Color? = nil
    ) -> some View {
        self.buttonStyle(
            PillButtonStyle(
                backgroundColor: backgroundColor,
                foregroundColor: foregroundColor,
                borderColor: borderColor,
                borderWidth: borderWidth,
                font: font,
                pressedOpacity: pressedOpacity,
                isSelected: isSelected,
                selectedBackgroundColor: selectedBackgroundColor
            )
        )
    }
}
