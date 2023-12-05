//
//  DLTextFieldStyle.swift
//  DeathNote
//
//  Created by Danylo Litvinchuk on 04.12.2023.
//

import UIKit

public enum DLTextFieldStyle {
    case none
    case line
    case bezel
    case roundedRect
    
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
