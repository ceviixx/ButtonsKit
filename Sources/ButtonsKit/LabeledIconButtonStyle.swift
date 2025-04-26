//
//  LabeledIconButtonStyle.swift
//  ButtonsKit
//
//  Created by ceviixx on 27.04.25.
//

import SwiftUI

public struct LabeledIconButtonStyle: ButtonStyle {
    let backgroundColor: Color
    let foregroundColor: Color
    let cornerRadius: CGFloat
    let pressedOpacity: Double
    let horizontalPadding: CGFloat
    let verticalPadding: CGFloat
    let iconSpacing: CGFloat

    public init(
        backgroundColor: Color = .accentColor,
        foregroundColor: Color = .white,
        cornerRadius: CGFloat = 10,
        pressedOpacity: Double = 0.7,
        horizontalPadding: CGFloat = 16,
        verticalPadding: CGFloat = 12,
        iconSpacing: CGFloat = 8
    ) {
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.cornerRadius = cornerRadius
        self.pressedOpacity = pressedOpacity
        self.horizontalPadding = horizontalPadding
        self.verticalPadding = verticalPadding
        self.iconSpacing = iconSpacing
    }

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .fontWeight(.semibold)
            .foregroundColor(foregroundColor)
            .padding(.horizontal, horizontalPadding)
            .padding(.vertical, verticalPadding)
            .frame(maxWidth: .infinity)
            .background(
                backgroundColor
                    .opacity(configuration.isPressed ? pressedOpacity : 1)
            )
            .cornerRadius(cornerRadius)
            .animation(.easeInOut(duration: 0.2), value: configuration.isPressed)
            .labelStyle(.titleAndIcon) // Optional, für klare Ausrichtung
    }
}

public extension View {
    func labeledIconButtonStyle(
        backgroundColor: Color = .accentColor,
        foregroundColor: Color = .white,
        cornerRadius: CGFloat = 10,
        pressedOpacity: Double = 0.7,
        horizontalPadding: CGFloat = 16,
        verticalPadding: CGFloat = 12,
        iconSpacing: CGFloat = 8
    ) -> some View {
        self.buttonStyle(
            LabeledIconButtonStyle(
                backgroundColor: backgroundColor,
                foregroundColor: foregroundColor,
                cornerRadius: cornerRadius,
                pressedOpacity: pressedOpacity,
                horizontalPadding: horizontalPadding,
                verticalPadding: verticalPadding,
                iconSpacing: iconSpacing
            )
        )
    }
}
