//
//  AngularGradientButtonStyle.swift
//  ButtonsKit
//
//  Created by ceviixx on 27.04.25.
//

import SwiftUI

public struct AngularGradientButtonStyle: ButtonStyle {
    let gradient: Gradient
    let center: UnitPoint
    let foregroundColor: Color
    let cornerRadius: CGFloat
    let pressedOpacity: Double
    let font: Font?

    public init(
        gradient: Gradient,
        center: UnitPoint = .center,
        foregroundColor: Color = .white,
        cornerRadius: CGFloat = 10,
        pressedOpacity: Double = 0.7,
        font: Font? = nil
    ) {
        self.gradient = gradient
        self.center = center
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
                AngularGradient(
                    gradient: gradient,
                    center: center
                )
                .opacity(configuration.isPressed ? pressedOpacity : 1)
            )
            .cornerRadius(cornerRadius)
            .animation(.easeInOut(duration: 0.2), value: configuration.isPressed)
    }
}

public extension View {
    func angularGradientButtonStyle(
        gradient: Gradient,
        center: UnitPoint = .center,
        foregroundColor: Color = .white,
        cornerRadius: CGFloat = 10,
        pressedOpacity: Double = 0.7,
        font: Font? = nil
    ) -> some View {
        self.buttonStyle(
            AngularGradientButtonStyle(
                gradient: gradient,
                center: center,
                foregroundColor: foregroundColor,
                cornerRadius: cornerRadius,
                pressedOpacity: pressedOpacity,
                font: font
            )
        )
    }
}
