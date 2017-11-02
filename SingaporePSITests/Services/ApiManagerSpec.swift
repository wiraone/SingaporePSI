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
                    waitUntil(timeout: 60) { done in
                        let param = InputForm()
                        let router = PSIRouter(endpoint: PSIEndpoint.fetchData(param: param))
                        
                        APIManager.sharedInstance.manager.request(router)
                            .validate()
                            .responseJSON(completionHandler: {
                                (response) -> Void in
                                
                                if let statusCode: Int = (response.response?.statusCode) {
                                    switch statusCode {
                                    case 200 ... 299:
                                        
                                        if let value = response.result.value as? JSON {
                                            self.psiData = PSIData.init(json: value)
                                            
                                            if let _ = self.psiData?.fault?.faultString {
                                                let errorHandler = PSIErrorHandler.init()
                                                errorHandler.errorCode = AppConstant.API.Error.Code.internalServerError
                                                errorHandler.errorMessage = AppConstant.API.Error.Message.internalServerError
                                            }
                                        }
                                        else{
                                            self.psiData = nil
                                        }
                                    default:
                                        self.psiData = nil
                                    }
                                }
                
                                expect(self.psiData?.regionMetadata?.first?.name).to(equal("national"))
                                expect(self.psiData?.regionMetadata?.first?.location?.latitude).to(equal(0))
                                expect(self.psiData?.regionMetadata?.first?.location?.latitude).to(equal(0))
                                
                                expect(self.psiData?.items?.count).to(equal(1))
                                expect(self.psiData?.items?.first?.timestamp).to(equal("2016-12-12T09:00:00+08:00"))
                                expect(self.psiData?.items?.first?.updateTimestamp).to(equal("2016-12-12T09:06:17+08:00"))
                                
                                expect(self.psiData?.items?.first?.readings?.o3SubIndex?.central).to(equal(9))
                                expect(self.psiData?.items?.first?.readings?.o3SubIndex?.north).to(equal(6))
                                expect(self.psiData?.items?.first?.readings?.o3SubIndex?.south).to(equal(7))
                                expect(self.psiData?.items?.first?.readings?.o3SubIndex?.west).to(equal(9))
                                expect(self.psiData?.items?.first?.readings?.o3SubIndex?.east).to(equal(10))
                                expect(self.psiData?.items?.first?.readings?.o3SubIndex?.national).to(equal(10))

                                expect(self.psiData?.items?.first?.readings?.pm10TwentyFourHourly?.central).to(equal(15))
                                expect(self.psiData?.items?.first?.readings?.pm10TwentyFourHourly?.north).to(equal(16))
                                expect(self.psiData?.items?.first?.readings?.pm10TwentyFourHourly?.south).to(equal(16))
                                expect(self.psiData?.items?.first?.readings?.pm10TwentyFourHourly?.west).to(equal(21))
                                expect(self.psiData?.items?.first?.readings?.pm10TwentyFourHourly?.east).to(equal(14))
                                expect(self.psiData?.items?.first?.readings?.pm10TwentyFourHourly?.national).to(equal(21))
                                
                                expect(self.psiData?.items?.first?.readings?.coSubIndex?.central).to(equal(6))
                                expect(self.psiData?.items?.first?.readings?.coSubIndex?.north).to(equal(5))
                                expect(self.psiData?.items?.first?.readings?.coSubIndex?.south).to(equal(3))
                                expect(self.psiData?.items?.first?.readings?.coSubIndex?.west).to(equal(6))
                                expect(self.psiData?.items?.first?.readings?.coSubIndex?.east).to(equal(2))
                                expect(self.psiData?.items?.first?.readings?.coSubIndex?.national).to(equal(6))
                                
                                expect(self.psiData?.items?.first?.readings?.pm10SubIndex?.central).to(equal(15))
                                expect(self.psiData?.items?.first?.readings?.pm10SubIndex?.north).to(equal(16))
                                expect(self.psiData?.items?.first?.readings?.pm10SubIndex?.south).to(equal(16))
                                expect(self.psiData?.items?.first?.readings?.pm10SubIndex?.west).to(equal(21))
                                expect(self.psiData?.items?.first?.readings?.pm10SubIndex?.east).to(equal(14))
                                expect(self.psiData?.items?.first?.readings?.pm10SubIndex?.national).to(equal(21))
                                
                                expect(self.psiData?.items?.first?.readings?.pm25TwentyFourHourly?.central).to(equal(8))
                                expect(self.psiData?.items?.first?.readings?.pm25TwentyFourHourly?.north).to(equal(9))
                                expect(self.psiData?.items?.first?.readings?.pm25TwentyFourHourly?.south).to(equal(7))
                                expect(self.psiData?.items?.first?.readings?.pm25TwentyFourHourly?.west).to(equal(11))
                                expect(self.psiData?.items?.first?.readings?.pm25TwentyFourHourly?.east).to(equal(8))
                                expect(self.psiData?.items?.first?.readings?.pm25TwentyFourHourly?.national).to(equal(11))
                                
                                expect(self.psiData?.items?.first?.readings?.so2SubIndex?.central).to(equal(2))
                                expect(self.psiData?.items?.first?.readings?.so2SubIndex?.north).to(equal(2))
                                expect(self.psiData?.items?.first?.readings?.so2SubIndex?.south).to(equal(3))
                                expect(self.psiData?.items?.first?.readings?.so2SubIndex?.west).to(equal(1))
                                expect(self.psiData?.items?.first?.readings?.so2SubIndex?.east).to(equal(2))
                                expect(self.psiData?.items?.first?.readings?.so2SubIndex?.national).to(equal(3))
                                
                                expect(self.psiData?.items?.first?.readings?.coEightHourMax?.central).to(equal(0.6))
                                expect(self.psiData?.items?.first?.readings?.coEightHourMax?.north).to(equal(0.51))
                                expect(self.psiData?.items?.first?.readings?.coEightHourMax?.south).to(equal(0.32))
                                expect(self.psiData?.items?.first?.readings?.coEightHourMax?.west).to(equal(0.58))
                                expect(self.psiData?.items?.first?.readings?.coEightHourMax?.east).to(equal(0.19))
                                expect(self.psiData?.items?.first?.readings?.coEightHourMax?.national).to(equal(0.6))
                                
                                expect(self.psiData?.items?.first?.readings?.so2TwentyFourHourly?.central).to(equal(4))
                                expect(self.psiData?.items?.first?.readings?.so2TwentyFourHourly?.north).to(equal(3))
                                expect(self.psiData?.items?.first?.readings?.so2TwentyFourHourly?.south).to(equal(5))
                                expect(self.psiData?.items?.first?.readings?.so2TwentyFourHourly?.west).to(equal(2))
                                expect(self.psiData?.items?.first?.readings?.so2TwentyFourHourly?.east).to(equal(4))
                                expect(self.psiData?.items?.first?.readings?.so2TwentyFourHourly?.national).to(equal(5))
                                
                                expect(self.psiData?.items?.first?.readings?.no2OneHourMax?.central).to(equal(18))
                                expect(self.psiData?.items?.first?.readings?.no2OneHourMax?.north).to(equal(25))
                                expect(self.psiData?.items?.first?.readings?.no2OneHourMax?.south).to(equal(6))
                                expect(self.psiData?.items?.first?.readings?.no2OneHourMax?.west).to(equal(17))
                                expect(self.psiData?.items?.first?.readings?.no2OneHourMax?.east).to(equal(14))
                                expect(self.psiData?.items?.first?.readings?.no2OneHourMax?.national).to(equal(25))
                                
                                expect(self.psiData?.items?.first?.readings?.pm25SubIndex?.central).to(equal(31))
                                expect(self.psiData?.items?.first?.readings?.pm25SubIndex?.north).to(equal(38))
                                expect(self.psiData?.items?.first?.readings?.pm25SubIndex?.south).to(equal(28))
                                expect(self.psiData?.items?.first?.readings?.pm25SubIndex?.west).to(equal(46))
                                expect(self.psiData?.items?.first?.readings?.pm25SubIndex?.east).to(equal(34))
                                expect(self.psiData?.items?.first?.readings?.pm25SubIndex?.national).to(equal(46))
                                
                                expect(self.psiData?.items?.first?.readings?.psiTwentyFourHourly?.central).to(equal(31))
                                expect(self.psiData?.items?.first?.readings?.psiTwentyFourHourly?.north).to(equal(38))
                                expect(self.psiData?.items?.first?.readings?.psiTwentyFourHourly?.south).to(equal(28))
                                expect(self.psiData?.items?.first?.readings?.psiTwentyFourHourly?.west).to(equal(46))
                                expect(self.psiData?.items?.first?.readings?.psiTwentyFourHourly?.east).to(equal(34))
                                expect(self.psiData?.items?.first?.readings?.psiTwentyFourHourly?.national).to(equal(46))
                                
                                expect(self.psiData?.items?.first?.readings?.o3EightHourMax?.central).to(equal(22))
                                expect(self.psiData?.items?.first?.readings?.o3EightHourMax?.north).to(equal(15))
                                expect(self.psiData?.items?.first?.readings?.o3EightHourMax?.south).to(equal(16))
                                expect(self.psiData?.items?.first?.readings?.o3EightHourMax?.west).to(equal(21))
                                expect(self.psiData?.items?.first?.readings?.o3EightHourMax?.east).to(equal(24))
                                expect(self.psiData?.items?.first?.readings?.o3EightHourMax?.national).to(equal(24))
                                
                                expect(self.psiData?.items?.first?.readings?.psiThreeHourly?.central).to(equal(17))
                                expect(self.psiData?.items?.first?.readings?.psiThreeHourly?.north).to(equal(24))
                                expect(self.psiData?.items?.first?.readings?.psiThreeHourly?.south).to(equal(22))
                                expect(self.psiData?.items?.first?.readings?.psiThreeHourly?.west).to(equal(26))
                                expect(self.psiData?.items?.first?.readings?.psiThreeHourly?.east).to(equal(25))
                                expect(self.psiData?.items?.first?.readings?.psiThreeHourly?.national).to(equal(23))
                                done()
                            })
                    }
                }
            }
            
            context("Test API Request failed internal server error") {
                
                beforeEach() {
                    let data = self.loadJSONPayload(fileName: "PSI Internal Server Error")
                    MockingjayProtocol.addStub(matcher: http(.get, uri: AppConstant.API.baseURL), builder: json(data!))
                }
                
                it("Return data JSON formmatted") {
                    waitUntil(timeout: 60) { done in
                        let param = InputForm()
                        let router = PSIRouter(endpoint: PSIEndpoint.fetchData(param: param))
                        
                        APIManager.sharedInstance.manager.request(router)
                            .validate()
                            .responseJSON(completionHandler: {
                                (response) -> Void in
                                
                                if let statusCode: Int = (response.response?.statusCode) {
                                    switch statusCode {
                                    case 200 ... 299:
                                        
                                        if let value = response.result.value as? JSON {
                                            self.psiData = PSIData.init(json: value)
                                            
                                            if let _ = self.psiData?.fault?.faultString {
                                                let errorHandler = PSIErrorHandler.init()
                                                errorHandler.errorCode = AppConstant.API.Error.Code.internalServerError
                                                errorHandler.errorMessage = AppConstant.API.Error.Message.internalServerError
                                            }
                                        }
                                        else{
                                            self.psiData = nil
                                        }
                                    default:
                                        self.psiData = nil
                                    }
                                }
                                
                                expect(self.psiData?.regionMetadata?.count == 0).to(beTrue())
                                expect(self.psiData?.items?.count == 0).to(beTrue())
                                expect(self.psiData?.fault?.faultString).to(equal(AppConstant.API.Error.Message.quotaExceedLimit))
                                done()
                            })
                    }
                }
            }
            
            context("Test API Request failed invalid date format") {
                
                beforeEach() {
                    self.stub(everything, http(400))
                }
                
                it("Return data JSON formmatted") {
                    waitUntil(timeout: 60) { done in
                        let param = InputForm()
                        let router = PSIRouter(endpoint: PSIEndpoint.fetchData(param: param))
                        
                        APIManager.sharedInstance.manager.request(router)
                            .validate()
                            .responseJSON(completionHandler: {
                                (response) -> Void in
                                var errorHandler: PSIErrorHandler? = nil
                                
                                if let statusCode: Int = (response.response?.statusCode) {
                                    switch statusCode {
                                    case 400 ... 403:
                                        //handle custom error on completion
                                        errorHandler = PSIErrorHandler.init()
                                        errorHandler?.errorCode = statusCode
                                        
                                        if statusCode == AppConstant.API.Error.Code.badRequest {
                                            errorHandler?.errorMessage = AppConstant.API.Error.Message.invalidDateFormat
                                        }
                                    default:
                                         errorHandler = PSIErrorHandler.init()
                                    }
                                }
                                expect(errorHandler?.errorMessage).to(equal(AppConstant.API.Error.Message.invalidDateFormat))
                                done()
                            })
                    }
                }
            }
        }
    }
}
