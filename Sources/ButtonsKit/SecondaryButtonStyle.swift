//
//  SecondaryButtonStyle.swift
//  ButtonsKit
//
//  Created by ceviixx on 27.04.25.
//

import SwiftUI

public struct SecondaryButtonStyle: ButtonStyle {
    let backgroundColor: Color
    let foregroundColor: Color
    let cornerRadius: CGFloat
    let pressedOpacity: Double

    public init(
        backgroundColor: Color = Color(.systemGray5),
        foregroundColor: Color = .primary,
        cornerRadius: CGFloat = 10,
        pressedOpacity: Double = 0.6
    ) {
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.cornerRadius = cornerRadius
        self.pressedOpacity = pressedOpacity
    }

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .fontWeight(.medium)
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                backgroundColor
                    .opacity(configuration.isPressed ? pressedOpacity : 1)
            )
            .foregroundColor(foregroundColor)
            .cornerRadius(cornerRadius)
            .animation(.easeInOut(duration: 0.2), value: configuration.isPressed)
    }
}

public extension View {
    func secondaryButtonStyle(
        backgroundColor: Color = Color(.systemGray5),
        foregroundColor: Color = .primary,
        cornerRadius: CGFloat = 10,
        pressedOpacity: Double = 0.6
    ) -> some View {
        self.buttonStyle(
            SecondaryButtonStyle(
                backgroundColor: backgroundColor,
                foregroundColor: foregroundColor,
                cornerRadius: cornerRadius,
                pressedOpacity: pressedOpacity
            )
        )
    }
}
