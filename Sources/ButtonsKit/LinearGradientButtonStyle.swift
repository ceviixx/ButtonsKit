//
//  LinearGradientButtonStyle.swift
//  ButtonsKit
//
//  Created by ceviixx on 27.04.25.
//

import SwiftUI

public struct LinearGradientButtonStyle: ButtonStyle {
    let gradient: Gradient
    let startPoint: UnitPoint
    let endPoint: UnitPoint
    let foregroundColor: Color
    let cornerRadius: CGFloat
    let pressedOpacity: Double
    let font: Font?

    public init(
        gradient: Gradient,
        startPoint: UnitPoint = .topLeading,
        endPoint: UnitPoint = .bottomTrailing,
        foregroundColor: Color = .white,
        cornerRadius: CGFloat = 10,
        pressedOpacity: Double = 0.7,
        font: Font? = nil
    ) {
        self.gradient = gradient
        self.startPoint = startPoint
        self.endPoint = endPoint
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
                LinearGradient(gradient: gradient, startPoint: startPoint, endPoint: endPoint)
                    .opacity(configuration.isPressed ? pressedOpacity : 1)
            )
            .cornerRadius(cornerRadius)
            .animation(.easeInOut(duration: 0.2), value: configuration.isPressed)
    }
}

public extension View {
    func linearGradientButtonStyle(
        gradient: Gradient,
        startPoint: UnitPoint = .topLeading,
        endPoint: UnitPoint = .bottomTrailing,
        foregroundColor: Color = .white,
        cornerRadius: CGFloat = 10,
        pressedOpacity: Double = 0.7,
        font: Font? = nil
    ) -> some View {
        self.buttonStyle(
            LinearGradientButtonStyle(
                gradient: gradient,
                startPoint: startPoint,
                endPoint: endPoint,
                foregroundColor: foregroundColor,
                cornerRadius: cornerRadius,
                pressedOpacity: pressedOpacity,
                font: font
            )
        )
    }
}
