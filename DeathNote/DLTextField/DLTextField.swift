//
//  DLTextField.swift
//  DeathNote
//
//  Created by Danylo Litvinchuk on 02.12.2023.
//

import SwiftUI

public typealias ValidationHandler = (_ isValid: Bool) -> ()

public struct DLTextField {
    
    var placeholder: NSMutableAttributedString
    var style: DLTextFieldStyle = .none
    var validationRule: DLValidationRule = .none
    var validationHandler: ValidationHandler?
    var visualFeedbackType: DLVisualFeedback = .none
    
    @Binding var text: String
    @Binding var shouldValidate: Bool
    
    public init(
        placeholder: String = "",
        text: Binding<String>,
        shouldValidate: Binding<Bool> = .constant(false)
    ) {
        self.placeholder = NSMutableAttributedString(string: placeholder)
        self._text = text
        self._shouldValidate = shouldValidate
    }
    
    public class Coordinator: NSObject, UITextFieldDelegate {
        
        let dlTextField: DLTextField
        @Binding var text: String
        @Binding var shouldValidate: Bool
        
        init(
            _ dlTextField: DLTextField,
            text: Binding<String>,
            shouldValidate: Binding<Bool>
        ) {
            self.dlTextField = dlTextField
            self._text = text
            self._shouldValidate = shouldValidate
        }
        
        public func textFieldDidChangeSelection(_ textField: UITextField) {
            text = textField.text ?? ""
        }
        
        public func textFieldDidEndEditing(_ textField: UITextField) {
            guard !shouldValidate else { return }
            dlTextField.internalValidate(textField: textField)
        }
        
        public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            guard !shouldValidate else { return true }
            dlTextField.internalValidate(textField: textField)
            return true
        }
        
    }
    
}

extension DLTextField: UIViewRepresentable {
    
    private func internalValidate(textField: UITextField) {
        let text = textField.text ?? ""
        let isValid = DLValidationService.shared.validate(
            text: text,
            rule: validationRule
        )
        validationHandler?(isValid)
        switch (isValid, visualFeedbackType) {
        case (true, .none):
            stroke(view: textField, color: .green)
        case (false, .none):
            stroke(view: textField, color: .red)
        case (false, .shake):
            shake(view: textField)
        default:
            return
        }
    }
    
    public func makeUIView(context: Context) -> UITextField {
        let textField = getTextField()
        textField.delegate = context.coordinator
        return textField
    }
    
    private func getTextField() -> UITextField {
        let textField = UITextField(frame: .zero)
        textField.borderStyle = style.uiStyle
        textField.attributedPlaceholder = placeholder
        return textField
    }
    
    public func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
        if shouldValidate {
            let isValid = DLValidationService.shared.validate(
                text: text,
                rule: validationRule
            )
            validationHandler?(isValid)
            shouldValidate = false
        }
    }
    
    public func makeCoordinator() -> Coordinator {
        Coordinator(
            self,
            text: $text,
            shouldValidate: $shouldValidate
        )
    }
    
}

extension DLTextField {
    
    func stroke(view: UIView, color: UIColor) {
        CATransaction.begin()
        
        let layer = CAShapeLayer()
        layer.strokeColor = color.cgColor
        layer.lineWidth = 3.0
        layer.fillColor = UIColor.clear.cgColor
        
        let path = UIBezierPath(
            roundedRect: CGRect(
                x: 0,
                y: 0,
                width: view.frame.size.width + 2,
                height: view.frame.size.height + 2
            ),
            byRoundingCorners: .allCorners,
            cornerRadii: CGSize(
                width: 5.0,
                height: 0.0
            )
        )
        layer.path = path.cgPath
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0.0
        animation.toValue = 1.0
        
        animation.duration = 1.0
        
        CATransaction.setCompletionBlock {
            print("Animation completed")
        }
        
        layer.add(animation, forKey: "validation_stroke")
        CATransaction.commit()
        view.layer.addSublayer(layer)
    }
    
    func shake(
        view: UIView,
        for duration: TimeInterval = 0.35,
        withTranslation translation: CGFloat = 8
    ) {
        
        let propertyAnimator = UIViewPropertyAnimator(
            duration: duration,
            dampingRatio: 0.35
        ) {
            view.transform = CGAffineTransform(
                translationX: translation,
                y: 0
            )
        }
        
        propertyAnimator.addAnimations(
            {
                view.transform = CGAffineTransform(
                    translationX: 0,
                    y: 0
                )
            },
            delayFactor: 0.2
        )
        
        propertyAnimator.startAnimation()
    }
    
}
