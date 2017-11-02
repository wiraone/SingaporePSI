//
//  AppConstant.swift
//  SingaporePSI
//
//  Created by wiraone on 30/10/17.
//  Copyright © 2017 Wirawan. All rights reserved.
//

import MapKit
import Foundation
import Gloss

//MARK: - Constant Default Value

struct AppConstant {
    
    struct API {
        static let baseURL = "https://api.data.gov.sg/v1/environment/psi"
        static let apiConsumerKey = "7AE7nJ3wgqgRVMExu04EVA1V8gEuRcWe"
        
        struct Error {
            struct Code
            {
                static let internalServerError = 500
                static let badRequest = 400
            }
            
            struct Message {
                static let internalServerError = "Internal server error"
                static let badRequest = "Bad request"
                static let invalidDateFormat = "invalid date format"
                static let quotaExceedLimit = "Rate limit quota violation. Quota limit  exceeded. Identifier : _default"
            }
        }
    }
    
    struct Header {
        static let apiKey = "api-key"
    }
    
    struct ErrorCode {
        static let undefined = 0
    }
    
    struct Validation {
        static let emptyDate = "Date cannot be empty"
    }
    
    struct DateFormat {
        static let date            = "yyyy-MM-dd"
        static let dateAndTime     = "YYYY-MM-ddTHH:mm:ss"
        static let defaultDateTime = "YYYY-MM-dd HH:mm:ss Z"
    }
    
    struct Default {
        static let emptyString           = ""
        static let emptyNumber           = 0.0
        static let emptyJSON: JSON       = [:]
        static let title                 = "Pollutant Standart Index"
        static let navigationBarTitle    = "PSI 24 Hour"
        static let activityIndicatorSize = 30
    }
    
    struct Font {
        
        struct Name {
            
            struct AvenirNext {
                static let regular = "AvenirNext-Regular"
            }
        }
        
        struct Size {
            static let big: CGFloat     = 20
            static let regular: CGFloat = 12
        }
    }
    
    struct Map {
        
        struct Center {
            static let latitude  = 1.35735
            static let longitude = 103.82
        }
        
        static let regionRadius: CLLocationDistance = 50000
        static let annotationRadius                 = 20
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
            static let psiTwentyFourHourly  = "psi_twenty_four_hourly"
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
        
        struct Error {
            static let message = "message"
            static let fault = "fault"
            static let faultString = "faultstring"
        }
    }
}
