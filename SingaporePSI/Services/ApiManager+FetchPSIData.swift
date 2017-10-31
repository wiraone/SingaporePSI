//
//  ApiManager+FetchPSIData.swift
//  SingaporePSI
//
//  Created by wiraone on 31/10/17.
//  Copyright © 2017 Wirawan. All rights reserved.
//

import Foundation
import Alamofire
import Gloss

extension APIManager {
    // MARK: Fetch API
    
    func fetchPSIData(param: InputForm, completion: @escaping (_ result: PSIData?, _ error: PSIErrorHandler?) -> ()) -> Request {
        let router = PSIRouter(endpoint: PSIEndpoint.fetchData(param: param))
        
        //validate codes including those from API for custom errors
        return manager.request(router)
            .validate()
            .responseJSON(completionHandler: {
                (response) -> Void in
                
                if let statusCode: Int = (response.response?.statusCode) {
                    switch statusCode {
                    case 200 ... 299:
                        print("API Success", response.result.debugDescription)
                        
                        if let value = response.result.value as? JSON {
                            let data = PSIData.init(json: value)
                            completion(data, nil)
                        }
                        else{
                            let error = PSIErrorHandler.init()
                            completion(nil, error)
                        }
                    case 400 ... 403:
                        //handle custom error on completion
                        print("API Failure", response.result.debugDescription)
                        return
                        
                    default:
                        if let error = response.result.error {
                            print("Default Error: %@", error.localizedDescription)
                            return
                        }
                    }
                }
            })
    }
}
