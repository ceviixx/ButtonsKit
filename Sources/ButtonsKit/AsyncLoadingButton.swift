//
//  AsyncLoadingButton.swift
//  ButtonsKit
//
//  Created by ceviixx on 27.04.25.
//

import SwiftUI

public struct AsyncLoadingButton<Label: View, Style: ButtonStyle>: View {
    @Binding var isLoading: Bool
    let action: () async throws -> Void
    let label: () -> Label
    let style: Style

    public init(
        isLoading: Binding<Bool>,
        style: Style,
        action: @escaping () async throws -> Void,
        @ViewBuilder label: @escaping () -> Label
    ) {
        self._isLoading = isLoading
        self.action = action
        self.style = style
        self.label = label
    }

    public var body: some View {
        Button {
            Task {
                guard !isLoading else { return }
                isLoading = true
                do {
                    try await action()
                } catch {
                    // Fehlerbehandlung, optional
                    print("LoadingButton error: \(error)")
                }
                isLoading = false
            }
        } label: {
            ZStack {
                label()
                    .opacity(isLoading ? 0 : 1)

                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                }
            }
        }
        .buttonStyle(style)
        .disabled(isLoading)
    }
}
