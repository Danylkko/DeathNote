//
//  DLValidationService.swift
//  DeathNote
//
//  Created by Danylo Litvinchuk on 05.12.2023.
//

import Foundation

/// Service that is used for validation.
class DLValidationService {
    
    /// `DLValidationService`'s singleton.
    static let shared = DLValidationService()
    private init() {}
    
    /// Func that validates text by a given rule.
    /// - parameter text: Text to be validated.
    /// - parameter rule: Rule to be validated by.
    /// - returns `true` on success and `false` on fail.
    func validate(text: String, rule: DLValidationRule) -> Bool {
        guard let pattern = rule.pattern else { return true }
        
        do {
            let regex = try NSRegularExpression(pattern: pattern)
            let nsRange = NSRange(text.startIndex..<text.endIndex, in: text)
            let matches = regex.matches(in: text, options: [], range: nsRange)
            return matches.count == 1
        } catch {
            print("Regex not valid: \(error) for string: \(text)")
            return false
        }
    }
}
