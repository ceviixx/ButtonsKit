//
//  ToggleButtonStyle.swift
//  ButtonsKit
//
//  Created by ceviixx on 27.04.25.
//

import SwiftUI

public struct ToggleButtonStyle: ButtonStyle {
    let isOn: Bool
    let onBackground: Color
    let offBackground: Color
    let onForeground: Color
    let offForeground: Color
    let cornerRadius: CGFloat
    let font: Font?

    public init(
        isOn: Bool,
        onBackground: Color = .accentColor,
        offBackground: Color = .gray.opacity(0.2),
        onForeground: Color = .white,
        offForeground: Color = .primary,
        cornerRadius: CGFloat = 10,
        font: Font? = nil
    ) {
        self.isOn = isOn
        self.onBackground = onBackground
        self.offBackground = offBackground
        self.onForeground = onForeground
        self.offForeground = offForeground
        self.cornerRadius = cornerRadius
        self.font = font
    }

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(font ?? .system(.body, weight: .medium))
            .foregroundColor(isOn ? onForeground : offForeground)
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                (isOn ? onBackground : offBackground)
                    .opacity(configuration.isPressed ? 0.7 : 1)
            )
            .cornerRadius(cornerRadius)
            .animation(.easeInOut(duration: 0.2), value: configuration.isPressed)
    }
}

public extension View {
    func toggleButtonStyle(
        isOn: Bool,
        onBackground: Color = .accentColor,
        offBackground: Color = .gray.opacity(0.2),
        onForeground: Color = .white,
        offForeground: Color = .primary,
        cornerRadius: CGFloat = 10,
        font: Font? = nil
    ) -> some View {
        self.buttonStyle(
            ToggleButtonStyle(
                isOn: isOn,
                onBackground: onBackground,
                offBackground: offBackground,
                onForeground: onForeground,
                offForeground: offForeground,
                cornerRadius: cornerRadius,
                font: font
            )
        )
    }
}
