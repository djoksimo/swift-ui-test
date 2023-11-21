//
//  ForagePINField.swift
//  ForageSwiftUISample
//
//  Created by Danilo Joksimovic on 2023-10-26.
//

import Foundation

import ForageSDK
import SwiftUI

public struct ForagePINField: UIViewRepresentable {
    @ObservedObject var viewModel: ForageViewModel

    public class Coordinator: NSObject, ForageElementDelegate {
        var parent: ForagePINField

        init(parent: ForagePINField) {
            self.parent = parent
        }

        public func textFieldDidChange(_ state: ObservableState) {
            parent.viewModel.pinInputValidationState = state
        }

        public func focusDidChange(_ state: ObservableState) {
            parent.viewModel.isPinElementFocused = state.isFirstResponder
        }
    }

    // MARK: Styling options

    var borderWidth: CGFloat = 1.0
    var borderColor: UIColor = .black
    // ....

    public func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    public func makeUIView(context: Context) -> ForagePINTextField {
        let textField = ForagePINTextField()

        textField.delegate = context.coordinator
        viewModel.pinTextField = textField

        return textField
    }

    public func updateUIView(_ uiView: ForagePINTextField, context _: Context) {
//        uiView.borderWidth = borderWidth
//        uiView.borderColor = borderColor
//        uiView.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    }
}
