//
//  Content.swift
//  SingaporePSI
//
//  Created by wiraone on 31/10/17.
//  Copyright © 2017 Wirawan. All rights reserved.
//

import Foundation
import Gloss

struct Content: Glossy {
    var national: Double?
    var south: Double?
    var north: Double?
    var east: Double?
    var central: Double?
    var west: Double?
    
    init?(json: JSON) {
        self.national = AppConstant.JSONKey.Content.national <~~ json
        self.central = AppConstant.JSONKey.Content.central <~~ json
        self.north = AppConstant.JSONKey.Content.north <~~ json
        self.south = AppConstant.JSONKey.Content.south <~~ json
        self.west = AppConstant.JSONKey.Content.west <~~ json
        self.east = AppConstant.JSONKey.Content.east <~~ json
    }
    
    func toJSON() -> JSON? {
        return [:]
    }
}
