//
//  PrimaryButtonStyle.swift
//  ButtonsKit
//
//  Created by ceviixx on 27.04.25.
//

import SwiftUI

public struct PrimaryButtonStyle: ButtonStyle {
    let backgroundColor: Color
    let foregroundColor: Color
    let cornerRadius: CGFloat
    let pressedOpacity: Double

    public init(
        backgroundColor: Color = .accentColor,
        foregroundColor: Color = .white,
        cornerRadius: CGFloat = 10,
        pressedOpacity: Double = 0.7
    ) {
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.cornerRadius = cornerRadius
        self.pressedOpacity = pressedOpacity
    }

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .fontWeight(.semibold)
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
    func primaryButtonStyle(
        backgroundColor: Color = .accentColor,
        foregroundColor: Color = .white,
        cornerRadius: CGFloat = 10,
        pressedOpacity: Double = 0.7
    ) -> some View {
        self.buttonStyle(
            PrimaryButtonStyle(
                backgroundColor: backgroundColor,
                foregroundColor: foregroundColor,
                cornerRadius: cornerRadius,
                pressedOpacity: pressedOpacity
            )
        )
    }
}
