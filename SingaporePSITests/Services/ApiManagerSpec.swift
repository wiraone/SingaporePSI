//
//  ApiManagerSpec.swift
//  SingaporePSI
//
//  Created by wiraone on 31/10/17.
//  Copyright © 2017 Wirawan. All rights reserved.
//

import Quick
import Nimble
import Gloss
import Alamofire
import Mockingjay
import Foundation

@testable import SingaporePSI

class ApiManagerSpec: QuickSpec {
    
    var psiData: PSIData?
    var request: Request?
    var psiErrorHandler: PSIErrorHandler?
    
    override func spec() {
        describe("API") {
            context("Test API Request successfull") {
                
                beforeEach() {
                    let data = self.loadJSONPayload(fileName: "PSI")
                    MockingjayProtocol.addStub(matcher: http(.get, uri: AppConstant.API.baseURL), builder: json(data!))
                }
                
                it("Return data JSON formmatted") {
                    self.request = APIManager.sharedInstance.fetchPSIData(date: nil, dateTime: nil, completion: { (data, error) in
                        
                        self.request = nil
                        
                        if let errorValid = error {
                            print(errorValid)
                        } else {
                            self.psiData = data!
                        }
                    })
                    
                    expect(self.psiData?.regionMetadata?.first?.name).toEventually(equal("national"))
                    expect(self.psiData?.items?.count).to(equal(1))
                }
            }
            
            context("Test API Request failed") {
                
                beforeEach() {
                    let data = self.loadJSONPayload(fileName: "PSI Internal Server Error")
                    MockingjayProtocol.addStub(matcher: http(.get, uri: AppConstant.API.baseURL), builder: json(data!))
                }
                
                it("Return data JSON formmatted") {
                    self.request = APIManager.sharedInstance.fetchPSIData(date: nil, dateTime: nil, completion: { (data, error) in
                        
                        self.request = nil
                        
                        if let errorValid = error {
                            print(errorValid)
                        } else {
                            self.psiData = data!
                        }
                    })

                    expect(self.psiData?.regionMetadata?.first?.name).toEventually(equal("national"))
                    expect(self.psiData?.regionMetadata?.first?.name).toEventually(equal("national"))
                    expect(self.psiData?.regionMetadata?.first?.name).toEventually(equal("national"))
                    expect(self.psiData?.regionMetadata?.first?.name).toEventually(equal("national"))
                    expect(self.psiData?.regionMetadata?.first?.name).toEventually(equal("national"))
                    
                    
                    expect(self.psiData?.items?.count).to(equal(1))
                }
            }
            
        }
    }
}
