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
        self.o3SubIndex = Content.init(json: AppConstant.JSONKey.Reading.o3SubIndex <~~ json ?? AppConstant.Default.emptyJSON)
        self.pm10TwentyFourHourly = Content.init(json: AppConstant.JSONKey.Reading.pm10TwentyFourHourly <~~ json ?? AppConstant.Default.emptyJSON)
        self.coSubIndex = Content.init(json: AppConstant.JSONKey.Reading.coSubIndex <~~ json ?? AppConstant.Default.emptyJSON)
        self.pm10SubIndex = Content.init(json: AppConstant.JSONKey.Reading.pm10SubIndex <~~ json ?? AppConstant.Default.emptyJSON)
        self.pm25TwentyFourHourly = Content.init(json: AppConstant.JSONKey.Reading.pm25TwentyFourHourly <~~ json ?? AppConstant.Default.emptyJSON)
        self.so2SubIndex = Content.init(json: AppConstant.JSONKey.Reading.so2SubIndex <~~ json ?? AppConstant.Default.emptyJSON)
        self.coEightHourMax = Content.init(json: AppConstant.JSONKey.Reading.coEightHourMax <~~ json ?? AppConstant.Default.emptyJSON)
        self.so2TwentyFourHourly = Content.init(json: AppConstant.JSONKey.Reading.so2TwentyFouHourly <~~ json ?? AppConstant.Default.emptyJSON)
        self.no2OneHourMax = Content.init(json: AppConstant.JSONKey.Reading.no2OneHourMax <~~ json ?? AppConstant.Default.emptyJSON)
        self.pm25SubIndex = Content.init(json: AppConstant.JSONKey.Reading.pm25SubIndex <~~ json ?? AppConstant.Default.emptyJSON)
        self.psiTwentyFourHourly = Content.init(json: AppConstant.JSONKey.Reading.psiTwentyFourHourly <~~ json ?? AppConstant.Default.emptyJSON)
        self.o3EightHourMax = Content.init(json: AppConstant.JSONKey.Reading.o3EightHourMax <~~ json ?? AppConstant.Default.emptyJSON)
        self.psiThreeHourly = Content.init(json: AppConstant.JSONKey.Reading.psiThreehourly <~~ json ?? AppConstant.Default.emptyJSON)
    }
    
    func toJSON() -> JSON? {
        return [:]
    }
}
