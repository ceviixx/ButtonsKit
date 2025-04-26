//
//  ToggleChipButton.swift
//  ButtonsKit
//
//  Created by ceviixx on 27.04.25.
//

import SwiftUI

public struct ToggleChipButton<Label: View>: View {
    @Binding var isSelected: Bool
    let action: (() -> Void)?
    let label: () -> Label

    let backgroundColor: Color
    let selectedBackgroundColor: Color
    let foregroundColor: Color
    let borderColor: Color?
    let font: Font?

    public init(
        isSelected: Binding<Bool>,
        backgroundColor: Color = .gray.opacity(0.2),
        selectedBackgroundColor: Color = .blue.opacity(0.2),
        foregroundColor: Color = .blue,
        borderColor: Color? = nil,
        font: Font? = nil,
        action: (() -> Void)? = nil,
        @ViewBuilder label: @escaping () -> Label
    ) {
        self._isSelected = isSelected
        self.backgroundColor = backgroundColor
        self.selectedBackgroundColor = selectedBackgroundColor
        self.foregroundColor = foregroundColor
        self.borderColor = borderColor
        self.font = font
        self.action = action
        self.label = label
    }

    public var body: some View {
        Button {
            isSelected.toggle()
            action?()
        } label: {
            label()
        }
        .pillButtonStyle(
            backgroundColor: backgroundColor,
            foregroundColor: foregroundColor,
            borderColor: borderColor,
            font: font,
            isSelected: isSelected,
            selectedBackgroundColor: selectedBackgroundColor
        )
    }
}
