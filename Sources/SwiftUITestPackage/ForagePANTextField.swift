//
//  ForagePANField.swift
//  ForageSwiftUISample
//
//  Created by Danilo Joksimovic on 2023-10-26.
//

import ForageSDK
import SwiftUI

public struct ForagePANField: UIViewRepresentable {
    @ObservedObject var viewModel: ForageViewModel

    public class Coordinator: NSObject, ForageElementDelegate {
        var parent: ForagePANField

        init(parent: ForagePANField) {
            self.parent = parent
        }

        public func textFieldDidChange(_ state: ObservableState) {
            parent.viewModel.panInputValidationState = state
        }

        public func focusDidChange(_ state: ObservableState) {
            parent.viewModel.isPanElementFocused = state.isFirstResponder
        }
    }

    // MARK: Styling options

    var borderWidth: CGFloat = 1.0
    var borderColor: UIColor = .black
    var cornerRadius: CGFloat = 4
    var padding: UIEdgeInsets = .init()
    var font: UIFont = .systemFont(ofSize: 20, weight: .regular)
    var textColor: UIColor = .black
    var tfTintColor: UIColor = .black

    public func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    public func makeUIView(context: Context) -> ForagePANTextField {
        let textField = ForagePANTextField()

        textField.delegate = context.coordinator
        viewModel.panTextField = textField

        return textField
    }

    public func updateUIView(_ uiView: ForagePANTextField, context _: Context) {
        uiView.borderWidth = borderWidth
        uiView.borderColor = borderColor
        uiView.cornerRadius = cornerRadius
        uiView.padding = padding
        uiView.font = font
        uiView.textColor = textColor
        uiView.tfTintColor = tfTintColor
    }
}
