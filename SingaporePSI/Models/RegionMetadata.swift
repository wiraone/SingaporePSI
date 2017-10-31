//
//  RegionMetadata.swift
//  SingaporePSI
//
//  Created by wiraone on 31/10/17.
//  Copyright © 2017 Wirawan. All rights reserved.
//

import Foundation
import Gloss

struct RegionMetadata: Glossy {
    var name: String?
    var location: Location?
    
    init?(json: JSON) {
        self.name = AppConstant.JSONKey.Region.name <~~ json
        self.location = Location.init(json: AppConstant.JSONKey.Region.location <~~ json ?? AppConstant.Default.emptyJSON)
    }
    
    func toJSON() -> JSON? {
        return [:]
    }
}
