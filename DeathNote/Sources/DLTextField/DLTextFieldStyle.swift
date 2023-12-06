//
//  DLTextFieldStyle.swift
//  DeathNote
//
//  Created by Danylo Litvinchuk on 04.12.2023.
//

import UIKit

/// Type that represents style of `DLTextField`.
public enum DLTextFieldStyle {
    case none
    case line
    case bezel
    case roundedRect
    
    /// Returns `UITextField.BorderStyle` associated value.
    var uiStyle: UITextField.BorderStyle {
        switch self {
        case .none:
            return .none
        case .bezel:
            return .bezel
        case .line:
            return .line
        case .roundedRect:
            return .roundedRect
        }
    }
}
