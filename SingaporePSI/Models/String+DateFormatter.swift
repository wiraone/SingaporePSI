//
//  String+DateFormatter.swift
//  SingaporePSI
//
//  Created by wiraone on 02/11/17.
//  Copyright © 2017 Wirawan. All rights reserved.
//

import Foundation

extension String {
    func cleanDateFormat() -> String {
        let cleanString = self.replacingOccurrences(of: "T", with: " ")
        let splitString = cleanString.components(separatedBy: "+")
        return splitString.count > 0 ? (splitString.first ?? AppConstant.Default.emptyString) : AppConstant.Default.emptyString
    }
}
