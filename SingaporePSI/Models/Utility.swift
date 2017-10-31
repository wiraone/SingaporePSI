//
//  Utility.swift
//  SingaporePSI
//
//  Created by wiraone on 31/10/17.
//  Copyright © 2017 Wirawan. All rights reserved.
//

import Foundation

struct Utility {
    
    static func convertDateToString(_ date: Date, dateFormatForm: String) -> String {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = dateFormatForm
        let toString = dateFormat.string(from: date)
        return toString
    }
}
