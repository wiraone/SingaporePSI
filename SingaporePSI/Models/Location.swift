//
//  Location.swift
//  SingaporePSI
//
//  Created by wiraone on 31/10/17.
//  Copyright © 2017 Wirawan. All rights reserved.
//

import Foundation
import Gloss

struct Location: Glossy {
    var longitude: Double?
    var latitude: Double?
    
    init?(json: JSON) {
        self.longitude = AppConstant.JSONKey.Location.longitude <~~ json
        self.latitude = AppConstant.JSONKey.Location.latitude <~~ json
    }
    
    func toJSON() -> JSON? {
        return [:]
    }
}
