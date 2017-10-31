//
//  AppConstant.swift
//  SingaporePSI
//
//  Created by wiraone on 30/10/17.
//  Copyright © 2017 Wirawan. All rights reserved.
//

import Foundation
import Gloss

//MARK: - Constant Default Value

struct AppConstant {
    
    struct API {
        static let baseURL = "https://api.data.gov.sg/v1/environment/psi"
        static let apiConsumerKey = "7AE7nJ3wgqgRVMExu04EVA1V8gEuRcWe"
    }
    
    struct Default {
        static let emptyString     = ""
        static let emptyNumber     = 0.0
        static let emptyJSON: JSON = [:]
    }
    
    struct JSONKey {
        
        struct Location {
            static let latitude  = "latitude"
            static let longitude = "longitude"
        }
        
        struct Region {
            static let name     = "name"
            static let location = "label_location"
        }
        
        struct Metadata {
            static let region = "region_metadata"
            static let items  = "items"
        }
        
        struct Item {
            static let timestamp       = "timestamp"
            static let updateTimestamp = "update_timestamp"
            static let readings        = "readings"
        }
        
        struct Reading {
            static let o3SubIndex           = "o3_sub_index"
            static let pm10TwentyFourHourly = "pm10_twenty_four_hourly"
            static let coSubIndex           = "co_sub_index"
            static let pm10SubIndex         = "pm10_sub_index"
            static let pm25TwentyFourHourly = "pm25_twenty_four_hourly"
            static let so2SubIndex          = "so2_sub_index"
            static let coEightHourMax       = "co_eight_hour_max"
            static let so2TwentyFouHourly   = "so2_twenty_four_hourly"
            static let no2OneHourMax        = "no2_one_hour_max"
            static let pm25SubIndex         = "pm25_sub_index"
            static let psiTwentyDourHourly  = "psi_twenty_four_hourly"
            static let o3EightHourMax       = "o3_eight_hour_max"
            static let psiThreehourly       = "psi_three_hourly"
        }
        
        struct Content {
            static let national = "national"
            static let north    = "north"
            static let south    = "south"
            static let east     = "east"
            static let west     = "west"
            static let central  = "central"
        }
    }
}
