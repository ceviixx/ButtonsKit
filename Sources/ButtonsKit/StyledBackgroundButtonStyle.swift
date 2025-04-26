//
//  StyledBackgroundButtonStyle.swift
//  ButtonsKit
//
//  Created by ceviixx on 27.04.25.
//

import SwiftUI

public struct StyledBackgroundButtonStyle: ButtonStyle {
    let background: AnyShapeStyle
    let foregroundColor: Color
    let cornerRadius: CGFloat
    let pressedOpacity: Double
    let font: Font?

    public init(
        background: some ShapeStyle,
        foregroundColor: Color = .white,
        cornerRadius: CGFloat = 10,
        pressedOpacity: Double = 0.7,
        font: Font? = nil
    ) {
        self.background = AnyShapeStyle(background)
        self.foregroundColor = foregroundColor
        self.cornerRadius = cornerRadius
        self.pressedOpacity = pressedOpacity
        self.font = font
    }

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(font ?? .system(.body, weight: .semibold))
            .foregroundColor(foregroundColor)
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                background
                    .opacity(configuration.isPressed ? pressedOpacity : 1)
            )
            .cornerRadius(cornerRadius)
            .animation(.easeInOut(duration: 0.2), value: configuration.isPressed)
    }
}

public extension View {
    func styledButtonStyle(
        background: some ShapeStyle,
        foregroundColor: Color = .white,
        cornerRadius: CGFloat = 10,
        pressedOpacity: Double = 0.7,
        font: Font? = nil
    ) -> some View {
        self.buttonStyle(
            StyledBackgroundButtonStyle(
                background: background,
                foregroundColor: foregroundColor,
                cornerRadius: cornerRadius,
                pressedOpacity: pressedOpacity,
                font: font
            )
        )
    }
}
