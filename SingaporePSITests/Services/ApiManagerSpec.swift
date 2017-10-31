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
    
    override func spec() {
        describe("API") {
            context("test get request") {
                
                beforeEach() {
                    let data = self.loadJSONPayload(fileName: "PSI")
                    MockingjayProtocol.addStub(matcher: http(.get, uri: AppConstant.API.baseURL), builder: json(data!))
                }
                
                it("return json") {
                    let endPointURL = URL.init(string: AppConstant.API.baseURL)
                    Alamofire.request(endPointURL!, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil)
                        .responseJSON { response in
                            switch response.result {
                            case .success(let value):
                                
                                self.psiData = PSIData.init(json: (value as? JSON)!)
                            case .failure(let error):
                                print(error)
                            }
                    }
                    expect(self.psiData?.regionMetadata?.first?.name).toEventually(equal("national"))
                }
            }
        }
    }
}
