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
        self.o3SubIndex = Content.init(json: (AppConstant.JSONKey.Reading.o3SubIndex <~~ json)!)
        self.pm10TwentyFourHourly = Content.init(json: (AppConstant.JSONKey.Reading.pm10TwentyFourHourly <~~ json)!)
        self.coSubIndex = Content.init(json: (AppConstant.JSONKey.Reading.coSubIndex <~~ json)!)
        self.pm10SubIndex = Content.init(json: (AppConstant.JSONKey.Reading.pm10SubIndex <~~ json)!)
        self.pm25TwentyFourHourly = Content.init(json: (AppConstant.JSONKey.Reading.pm25TwentyFourHourly <~~ json)!)
        self.so2SubIndex = Content.init(json: (AppConstant.JSONKey.Reading.so2SubIndex <~~ json)!)
        
        self.no2OneHourMax = Content.init(json: (AppConstant.JSONKey.Reading.no2OneHourMax <~~ json)!)
        self.pm25SubIndex = Content.init(json: (AppConstant.JSONKey.Reading.pm25SubIndex <~~ json)!)
        self.psiTwentyFourHourly = Content.init(json: (AppConstant.JSONKey.Reading.psiTwentyFourHourly <~~ json)!)
        self.o3EightHourMax = Content.init(json: (AppConstant.JSONKey.Reading.o3EightHourMax <~~ json)!)
        self.psiThreeHourly = Content.init(json: (AppConstant.JSONKey.Reading.psiThreehourly <~~ json)!)        
    }
    
    func toJSON() -> JSON? {
        return [:]
    }
}
