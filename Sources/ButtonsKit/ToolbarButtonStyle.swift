//
//  ToolbarButtonStyle.swift
//  ButtonsKit
//
//  Created by ceviixx on 27.04.25.
//

import SwiftUI

public struct ToolbarButtonStyle: ButtonStyle {
    let backgroundColor: Color
    let foregroundColor: Color
    let cornerRadius: CGFloat
    let size: CGFloat
    let pressedOpacity: Double

    public init(
        backgroundColor: Color = Color(.systemGray5),
        foregroundColor: Color = .primary,
        cornerRadius: CGFloat = 8,
        size: CGFloat = 32,
        pressedOpacity: Double = 0.6
    ) {
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.cornerRadius = cornerRadius
        self.size = size
        self.pressedOpacity = pressedOpacity
    }

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: size * 0.5, weight: .medium))
            .frame(width: size, height: size)
            .foregroundColor(foregroundColor)
            .background(
                backgroundColor
                    .opacity(configuration.isPressed ? pressedOpacity : 1)
            )
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
            .animation(.easeInOut(duration: 0.2), value: configuration.isPressed)
    }
}

public extension View {
    func toolbarButtonStyle(
        backgroundColor: Color = Color(.systemGray5),
        foregroundColor: Color = .primary,
        cornerRadius: CGFloat = 8,
        size: CGFloat = 32,
        pressedOpacity: Double = 0.6
    ) -> some View {
        self.buttonStyle(
            ToolbarButtonStyle(
                backgroundColor: backgroundColor,
                foregroundColor: foregroundColor,
                cornerRadius: cornerRadius,
                size: size,
                pressedOpacity: pressedOpacity
            )
        )
    }
}
