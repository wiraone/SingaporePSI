//
//  Reading.swift
//  SingaporePSI
//
//  Created by wiraone on 31/10/17.
//  Copyright © 2017 Wirawan. All rights reserved.
//

import Foundation
import Gloss

struct Reading: Glossy {
    var o3SubIndex: Content?
    var pm10TwentyFourHourly: Content?
    var coSubIndex: Content?
    var pm10SubIndex: Content?
    var pm25TwentyFourHourly: Content?
    var so2SubIndex: Content?
    var coEightHourMax: Content?
    var so2TwentyFourHourly: Content?
    var no2OneHourMax: Content?
    var pm25SubIndex: Content?
    var psiTwentyFourHourly: Content?
    var o3EightHourMax: Content?
    var psiThreeHourly: Content?
    
    init?(json: JSON) {
        
    }
    
    func toJSON() -> JSON? {
        return [:]
    }
}
