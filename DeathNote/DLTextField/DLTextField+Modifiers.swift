//
//  DLTextField+Modifiers.swift
//  DeathNote
//
//  Created by Danylo Litvinchuk on 03.12.2023.
//

import Foundation
import UIKit
import SwiftUI

extension DLTextField {
    
    public func placeholderColor(_ color: Color) -> Self {
        let textField = self
        let placeholderStr = textField.placeholder.string
        textField.placeholder.addAttribute(
            .foregroundColor,
            value: UIColor(color),
            range: NSMakeRange(0, placeholderStr.count)
        )
        return textField
    }
    
    public func visualFeedback(_ type: DLVisualFeedback) -> Self {
        var textField = self
        textField.visualFeedbackType = type
        return textField
    }
    
    public func style(_ style: DLTextFieldStyle) -> Self {
        var textField = self
        textField.style = style
        return textField
    }
    
    public func setValidationRule(_ rule: DLValidationRule) -> Self {
        var textField = self
        textField.validationRule = rule
        return textField
    }
    
    public func onValidation(_ handler: @escaping ValidationHandler) -> Self {
        var textField = self
        textField.validationHandler = handler
        return textField
    }
    
}
