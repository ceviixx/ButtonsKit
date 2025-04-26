//
//  DisabledButtonStyle.swift
//  ButtonsKit
//
//  Created by ceviixx on 27.04.25.
//

import SwiftUI

public struct DisabledButtonStyle: ButtonStyle {
    let backgroundColor: Color
    let foregroundColor: Color
    let cornerRadius: CGFloat
    let opacity: Double

    public init(
        backgroundColor: Color = Color(.systemGray4),
        foregroundColor: Color = .white,
        cornerRadius: CGFloat = 10,
        opacity: Double = 0.5
    ) {
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.cornerRadius = cornerRadius
        self.opacity = opacity
    }

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .fontWeight(.regular)
            .padding()
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .foregroundColor(foregroundColor)
            .cornerRadius(cornerRadius)
            .opacity(opacity)
    }
}

public extension View {
    func disabledButtonStyle(
        backgroundColor: Color = Color(.systemGray4),
        foregroundColor: Color = .white,
        cornerRadius: CGFloat = 10,
        opacity: Double = 0.5
    ) -> some View {
        self.buttonStyle(
            DisabledButtonStyle(
                backgroundColor: backgroundColor,
                foregroundColor: foregroundColor,
                cornerRadius: cornerRadius,
                opacity: opacity
            )
        )
    }
}
