//
//  ApiManager.swift
//  SingaporePSI
//
//  Created by wiraone on 31/10/17.
//  Copyright © 2017 Wirawan. All rights reserved.
//

import Foundation
import Alamofire

public class APIManager {
    
    public class var sharedInstance: APIManager {
        struct Singleton {
            static let instance : APIManager = APIManager()
        }
        return Singleton.instance
    }
    
    let manager = SessionManager()
    
    init() {
    }
}
