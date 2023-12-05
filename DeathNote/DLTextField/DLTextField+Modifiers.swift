//
//  DLTextField+Modifiers.swift
//  DeathNote
//
//  Created by Danylo Litvinchuk on 03.12.2023.
//

import Foundation
import UIKit
import SwiftUI

/// DLTextField Modifiers
extension DLTextField {
    
    /// Modifier that allows to change placeholder color.
    /// - parameter color: Color of placeholder text.
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
    
    /// Modifier that allows to change type of visual feedback.
    /// - parameter type: Type of visual feedback.
    public func visualFeedback(_ type: DLVisualFeedback) -> Self {
        var textField = self
        textField.visualFeedbackType = type
        return textField
    }
    
    /// Modifier that allows to change style of control.
    /// - parameter style: Style of control.
    public func style(_ style: DLTextFieldStyle) -> Self {
        var textField = self
        textField.style = style
        return textField
    }
    
    /// Modifier that allows to set validation rule.
    /// - parameter rule: Rule which is used to validate control's text.
    public func setValidationRule(_ rule: DLValidationRule) -> Self {
        var textField = self
        textField.validationRule = rule
        return textField
    }
    
    /// Modifier that notifies about validation status.
    /// - parameter handler: has argument `isValid`,  that represents state of validation.
    public func onValidation(_ handler: @escaping ValidationHandler) -> Self {
        var textField = self
        textField.validationHandler = handler
        return textField
    }
    
}
