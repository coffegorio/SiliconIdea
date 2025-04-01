//
//  CustomTextFiledWrapper.swift
//  SiliconIdea
//
//  Created by Егорио on 29.03.2025.
//

import SwiftUI

struct CustomTextFieldWrapper: UIViewRepresentable {
    var placeholder: String
    var leftImage: UIImage?
    @Binding var text: String
    
    func makeUIView(context: Context) -> CustomTextField {
        let textField = CustomTextField(customPlaceholder: placeholder, leftsideImage: leftImage)
        textField.delegate = context.coordinator
        return textField
    }
    
    func updateUIView(_ uiView: CustomTextField, context: Context) {
        uiView.text = text
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UITextFieldDelegate {
        var parent: CustomTextFieldWrapper
        
        init(_ parent: CustomTextFieldWrapper) {
            self.parent = parent
        }
        
        func textFieldDidChangeSelection(_ textField: UITextField) {
            parent.text = textField.text ?? ""
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }
    }
}
