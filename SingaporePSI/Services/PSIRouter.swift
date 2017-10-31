//
//  PSIRouter.swift
//  SingaporePSI
//
//  Created by wiraone on 31/10/17.
//  Copyright © 2017 Wirawan. All rights reserved.
//

import Foundation
import Alamofire

//PSI Endpoint Enum
enum PSIEndpoint {
    case fetchData(date: String?, dateTime: String?)
}

//Session Router Class based on BaseRouter
class PSIRouter : BaseRouter {
    
    var endpoint: PSIEndpoint
    init(endpoint: PSIEndpoint) {
        self.endpoint = endpoint
    }
    
    override var method: Alamofire.HTTPMethod {
        switch endpoint {
        case .fetchData: return .get
        }
    }
    
    override var parameters: APIParams {
        switch endpoint {
        case .fetchData(let date, let dateTime):
            var param: APIParams = [:]
            
            if let dateValue = date {
                param?["date"] = dateValue as AnyObject
            }
            
            if let dateTimeValue = dateTime {
                param?["date_time"] = dateTimeValue as AnyObject
            }
            
            return param
        }
    }
    
    override var encoding: Alamofire.ParameterEncoding? {
        switch endpoint {
        case .fetchData: return URLEncoding.default
        }
    }
}
