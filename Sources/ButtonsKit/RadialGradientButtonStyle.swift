//
//  RadialGradientButtonStyle.swift
//  ButtonsKit
//
//  Created by ceviixx on 27.04.25.
//

import SwiftUI

public struct RadialGradientButtonStyle: ButtonStyle {
    let gradient: Gradient
    let center: UnitPoint
    let startRadius: CGFloat
    let endRadius: CGFloat
    let foregroundColor: Color
    let cornerRadius: CGFloat
    let pressedOpacity: Double
    let font: Font?

    public init(
        gradient: Gradient,
        center: UnitPoint = .center,
        startRadius: CGFloat = 5,
        endRadius: CGFloat = 200,
        foregroundColor: Color = .white,
        cornerRadius: CGFloat = 10,
        pressedOpacity: Double = 0.7,
        font: Font? = nil
    ) {
        self.gradient = gradient
        self.center = center
        self.startRadius = startRadius
        self.endRadius = endRadius
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
                RadialGradient(
                    gradient: gradient,
                    center: center,
                    startRadius: startRadius,
                    endRadius: endRadius
                )
                .opacity(configuration.isPressed ? pressedOpacity : 1)
            )
            .cornerRadius(cornerRadius)
            .animation(.easeInOut(duration: 0.2), value: configuration.isPressed)
    }
}

public extension View {
    func radialGradientButtonStyle(
        gradient: Gradient,
        center: UnitPoint = .center,
        startRadius: CGFloat = 5,
        endRadius: CGFloat = 200,
        foregroundColor: Color = .white,
        cornerRadius: CGFloat = 10,
        pressedOpacity: Double = 0.7,
        font: Font? = nil
    ) -> some View {
        self.buttonStyle(
            RadialGradientButtonStyle(
                gradient: gradient,
                center: center,
                startRadius: startRadius,
                endRadius: endRadius,
                foregroundColor: foregroundColor,
                cornerRadius: cornerRadius,
                pressedOpacity: pressedOpacity,
                font: font
            )
        )
    }
}
