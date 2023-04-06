//
//  FilterValidation.swift
//  AppStoreReviews
//
//  Created by Monali on 16/03/22.
//  Copyright © 2022 ING. All rights reserved.
//

import Foundation

// As per Single responsibility principle every class should have single responsility so for validation FilterValidation
// and without dependency seperatly we can Test Validations for Unit testing
struct AddNoteValidation {
    
    func validate(title: String?, desc: String?) -> ValidationResponse {

        if title?.count ?? 0 > 0 && desc?.count ?? 0 > 0 {
             return ValidationResponse(message: nil, isValid: true)
        }
        else if title == nil || title == "" {
            return ValidationResponse(message: "Please enter title", isValid: false)
        }
        else if desc == nil || desc == "" {
            return ValidationResponse(message: "Please enter description", isValid: false)
        }
        
        return ValidationResponse(message: nil, isValid: true)
    }
}
