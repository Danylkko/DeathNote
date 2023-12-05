//
//  DLValidationService.swift
//  DeathNote
//
//  Created by Danylo Litvinchuk on 05.12.2023.
//

import Foundation

class DLValidationService {
    
    static let shared = DLValidationService()
    
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
