//
//  ApiManager.swift
//  SingaporePSI
//
//  Created by wiraone on 31/10/17.
//  Copyright © 2017 Wirawan. All rights reserved.
//

import Foundation
import Alamofire

class NetworkStatus {
    static let sharedInstance = NetworkStatus()
    
    private init() {}
    
    let reachabilityManager = Alamofire.NetworkReachabilityManager(host: AppConstant.API.baseURL)
    
    func startNetworkReachabilityObserver() {
        reachabilityManager?.listener = { status in
            var message: String? = nil
            
            switch status {
                
            case .notReachable:
                message = "The network is not reachable"
                
            case .unknown :
                message = "It is unknown whether the network is reachable"
                
            case .reachable(.ethernetOrWiFi):
                //"The network is reachable over the WiFi connection"
                message = nil
            case .reachable(.wwan):
                //"The network is reachable over the WWAN connection"
                message = nil
            }
            
            if let topController = UIApplication.topViewController(),
                let errorMessage = message {
               
                let error = PSIErrorHandler.init()
                error.errorMessage = errorMessage
                Utility.showAlert(with: error, activeViewController: topController)
            }
        }
        reachabilityManager?.startListening()
    }
}

public class APIManager {
    
    public class var sharedInstance: APIManager {
        struct Singleton {
            static let instance : APIManager = APIManager()
        }
        return Singleton.instance
    }
    
    let manager = SessionManager()
    
    init() {
        NetworkStatus.sharedInstance.startNetworkReachabilityObserver()
    }
}
