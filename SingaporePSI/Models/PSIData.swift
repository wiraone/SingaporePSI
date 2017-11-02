//
//  PSIData.swift
//  SingaporePSI
//
//  Created by wiraone on 30/10/17.
//  Copyright © 2017 Wirawan. All rights reserved.
//

import Foundation
import Gloss

struct PSIData: Glossy {
    var regionMetadata: [RegionMetadata]?
    var items: [Item]?
    var fault: Fault?
    
    init?(json: JSON) {
        self.regionMetadata = parseRegionMetadata(jsons: AppConstant.JSONKey.Metadata.region <~~ json)
        self.items = parseItemMetadata(jsons: AppConstant.JSONKey.Metadata.items <~~ json)
        self.fault = Fault.init(json: AppConstant.JSONKey.Error.fault <~~ json ?? AppConstant.Default.emptyJSON)
    }
    
    func parseRegionMetadata(jsons: [JSON]?) -> [RegionMetadata]{
        guard let jsonValues =  jsons else {
            return []
        }
        
        var regionMetadas = [RegionMetadata]()
        
        for json in jsonValues {
            
            if let subModel  = RegionMetadata(json: json) {
                regionMetadas.append(subModel)
            }
        }
        return regionMetadas
    }
    
    func parseItemMetadata(jsons: [JSON]?) -> [Item]{
        guard let jsonValues =  jsons else {
            return []
        }
        
        var items = [Item]()
        
        for json in jsonValues {
            
            if let subModel  = Item(json: json) {
                items.append(subModel)
            }
        }
        return items
    }
    
    func toJSON() -> JSON? {
        return [:]
    }
}
