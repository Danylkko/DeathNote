//
//  DLValidationRule.swift
//  DeathNote
//
//  Created by Danylo Litvinchuk on 05.12.2023.
//

import Foundation

/// Type that represents validation rule of `DLTextField`.
public enum DLValidationRule {
    case none
    case ukrainePhoneNumber
    case internationalPhoneNumber
    case email
    case name
    case cardNumber
    
    /// Value that represents regex pattern of type.
    /// - returns `nil` for type `none`.
    var pattern: String? {
        switch self {
        case .ukrainePhoneNumber:
            return "^\\+?3?8?(0\\d{9})$"
        case .internationalPhoneNumber:
            return "^\\+?[1-9]\\d{1,14}$"
        case .email:
            return "^\\w+([\\.-]?\\w+)*@\\w+([\\.-]?\\w+)*(\\.\\w{2,3})+$"
        case .name:
            return "^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$"
        case .cardNumber:
            return "^\\d{16}$"
        default:
            return nil
        }
    }
}
