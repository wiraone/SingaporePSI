//
//  Fault.swift
//  SingaporePSI
//
//  Created by wiraone on 02/11/17.
//  Copyright © 2017 Wirawan. All rights reserved.
//

import Foundation

import Foundation
import Gloss

struct Fault: Glossy {
    var faultString: String?
    
    init?(json: JSON) {
        self.faultString = AppConstant.JSONKey.Error.faultString <~~ json
    }
    
    func toJSON() -> JSON? {
        return [:]
    }
}
