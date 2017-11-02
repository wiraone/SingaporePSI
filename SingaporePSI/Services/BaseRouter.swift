//
//  BaseRouter.swift
//  SingaporePSI
//
//  Created by wiraone on 31/10/17.
//  Copyright © 2017 Wirawan. All rights reserved.
//

import Foundation
import Alamofire
import Gloss

import Alamofire

typealias APIParams = [String: AnyObject]?

//MARK: - APIConfiguration protocol

protocol APIConfiguration {
    var method: Alamofire.HTTPMethod { get }
    var encoding: Alamofire.ParameterEncoding? { get }
    var parameters: APIParams? { get }
    var isAuthorized: Bool { get }
}


//MARK: - BaseRouter Class based on Alamofire URLRequestConvertible and custom APIConfiguration

class BaseRouter : URLRequestConvertible, APIConfiguration {
    func asURLRequest() throws -> URLRequest {
        return request
    }
    
    init() {}
    
    //MARK : Base Properties
    
    var method: Alamofire.HTTPMethod {
        fatalError("[\(String(describing: self)) - \(#function))] Must be overridden in subclass")
    }
    
    var encoding: Alamofire.ParameterEncoding? {
        fatalError("[\(String(describing: self))) - \(#function))] Must be overridden in subclass")
    }
    
    var parameters: APIParams? {
        fatalError("[\(String(describing: self))) - \(#function))] Must be overridden in subclass")
    }
    
    var isAuthorized:Bool {
        get {
            return false
        }
    }
    
    //MARK : Base Request
    
    var request: URLRequest {
        var request = URLRequest(url: URL.init(string: AppConstant.API.baseURL)!)
        request.httpMethod = method.rawValue
        
        if isAuthorized {
            request.setValue(AppConstant.API.apiConsumerKey, forHTTPHeaderField: AppConstant.Header.apiKey)
        }
        
        if let encoding = encoding {
            do {
                return try encoding.encode(request, with: parameters ?? nil)
            }
            catch {
            }
        }
        
        return request
    }
}
