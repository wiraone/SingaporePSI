//
//  Item.swift
//  SingaporePSI
//
//  Created by wiraone on 30/10/17.
//  Copyright © 2017 Wirawan. All rights reserved.
//

import Foundation
import Gloss

struct Item: Glossy {
    var timestamp: String?
    var updateTimestamp: String?
    var readings: Reading?
    
    init?(json: JSON) {
        self.timestamp = AppConstant.JSONKey.Item.timestamp <~~ json
        self.updateTimestamp = AppConstant.JSONKey.Item.updateTimestamp <~~ json
        self.readings = Reading.init(json: AppConstant.JSONKey.Item.readings <~~ json ?? AppConstant.Default.emptyJSON)
    }
    
    func toJSON() -> JSON? {
        return [:]
    }
}
