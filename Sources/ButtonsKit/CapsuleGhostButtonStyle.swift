//
//  CapsuleGhostButtonStyle.swift
//  ButtonsKit
//
//  Created by ceviixx on 27.04.25.
//

import SwiftUI

public struct CapsuleGhostButtonStyle: ButtonStyle {
    let foregroundColor: Color
    let pressedBackground: Color
    let selectedBackground: Color
    let pressedOpacity: Double
    let font: Font?
    let isSelected: Bool?

    public init(
        foregroundColor: Color = .accentColor,
        pressedBackground: Color = Color.accentColor.opacity(0.1),
        selectedBackground: Color = Color.accentColor.opacity(0.2),
        pressedOpacity: Double = 1.0,
        font: Font? = nil,
        isSelected: Bool? = nil
    ) {
        self.foregroundColor = foregroundColor
        self.pressedBackground = pressedBackground
        self.selectedBackground = selectedBackground
        self.pressedOpacity = pressedOpacity
        self.font = font
        self.isSelected = isSelected
    }

    public func makeBody(configuration: Configuration) -> some View {
        let background: Color = {
            if let isSelected = isSelected {
                return isSelected ? selectedBackground : Color.clear
            } else {
                return configuration.isPressed ? pressedBackground.opacity(pressedOpacity) : Color.clear
            }
        }()

        return configuration.label
            .font(font ?? .system(.callout, weight: .medium))
            .foregroundColor(foregroundColor)
            .padding(.vertical, 8)
            .padding(.horizontal, 16)
            .background(background)
            .clipShape(Capsule())
            .animation(.easeInOut(duration: 0.15), value: configuration.isPressed)
    }
}

public extension View {
    func capsuleGhostButtonStyle(
        foregroundColor: Color = .accentColor,
        pressedBackground: Color = Color.accentColor.opacity(0.1),
        selectedBackground: Color = Color.accentColor.opacity(0.2),
        pressedOpacity: Double = 1.0,
        font: Font? = nil,
        isSelected: Bool? = nil
    ) -> some View {
        self.buttonStyle(
            CapsuleGhostButtonStyle(
                foregroundColor: foregroundColor,
                pressedBackground: pressedBackground,
                selectedBackground: selectedBackground,
                pressedOpacity: pressedOpacity,
                font: font,
                isSelected: isSelected
            )
        )
    }
}
