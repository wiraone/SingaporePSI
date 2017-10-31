//
//  InputForm.swift
//  SingaporePSI
//
//  Created by wiraone on 31/10/17.
//  Copyright © 2017 Wirawan. All rights reserved.
//

import Foundation

struct InputForm {
    var date: String = AppConstant.Default.emptyString
    var dateTime: String = AppConstant.Default.emptyString
    var errorMessage: String = AppConstant.Validation.emptyDate
   
    mutating func isValid() -> Bool {
        var isValid = true
        
        let isDateEmpty = date.isEmpty
        let isDateTimeEmpty = dateTime.isEmpty
        
        if isDateEmpty == true {
            isValid = false
        }
        else if isDateTimeEmpty == true {
            isValid = false
        }
        return isValid
    }

}
