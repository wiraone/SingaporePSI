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
    case fetchData(param: InputForm)
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
    
    override var parameters: APIParams? {
        switch endpoint {
        case .fetchData(let input):
            var param: APIParams = [:]
            
            if input.date.isEmpty == false {
                param?["date"] = input.date as AnyObject
            }
            
            if input.dateTime.isEmpty == false {
                param?["date_time"] = input.dateTime as AnyObject
            }
            
            return param
        }
    }
    
    override var isAuthorized: Bool {
        return true
    }
    
    override var encoding: Alamofire.ParameterEncoding? {
        switch endpoint {
        case .fetchData: return URLEncoding.default
        }
    }
}
