//
//  IconButtonStyle.swift
//  ButtonsKit
//
//  Created by ceviixx on 27.04.25.
//

import SwiftUI

public struct IconButtonStyle: ButtonStyle {
    let backgroundColor: Color
    let foregroundColor: Color
    let pressedScale: CGFloat
    let size: CGFloat
    let shape: ShapeType

    public enum ShapeType {
        case circle, roundedRectangle(cornerRadius: CGFloat)
    }

    public init(
        backgroundColor: Color = Color(.systemGray5),
        foregroundColor: Color = .primary,
        pressedScale: CGFloat = 0.9,
        size: CGFloat = 44,
        shape: ShapeType = .circle
    ) {
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.pressedScale = pressedScale
        self.size = size
        self.shape = shape
    }

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: size * 0.5))
            .foregroundColor(foregroundColor)
            .frame(width: size, height: size)
            .background(
                Group {
                    switch shape {
                    case .circle:
                        Circle().fill(backgroundColor)
                    case .roundedRectangle(let cornerRadius):
                        RoundedRectangle(cornerRadius: cornerRadius).fill(backgroundColor)
                    }
                }
                .scaleEffect(configuration.isPressed ? pressedScale : 1)
                .animation(.easeInOut(duration: 0.2), value: configuration.isPressed)
            )
    }
}

public extension View {
    func iconButtonStyle(
        backgroundColor: Color = Color(.systemGray5),
        foregroundColor: Color = .primary,
        pressedScale: CGFloat = 0.9,
        size: CGFloat = 44,
        shape: IconButtonStyle.ShapeType = .circle
    ) -> some View {
        self.buttonStyle(
            IconButtonStyle(
                backgroundColor: backgroundColor,
                foregroundColor: foregroundColor,
                pressedScale: pressedScale,
                size: size,
                shape: shape
            )
        )
    }
}
