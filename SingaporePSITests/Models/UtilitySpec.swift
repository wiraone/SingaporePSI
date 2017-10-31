//
//  UtilitySpec.swift
//  SingaporePSI
//
//  Created by wiraone on 31/10/17.
//  Copyright © 2017 Wirawan. All rights reserved.
//

import Quick
import Nimble

@testable import SingaporePSI

class UtilitySpec: QuickSpec {
    
    override func spec() {
        var dateString: String = AppConstant.Default.emptyString
        
        describe("Validate date to string converter") {
            beforeEach {
                let dummyStringDate = "2016-10-10"
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = AppConstant.DateFormat.date
                
                if let dummyDate = dateFormatter.date(from: dummyStringDate) {
                    dateString = Utility.convertDateToString(dummyDate, dateFormatForm: AppConstant.DateFormat.date)
                }
            }
            
            context("when date converted to string") {
                it("should have correct string date value") {
                    expect(dateString.isEmpty).to(beFalse())
                    expect(dateString).to(equal("2016-10-10"))
                }
            }
        }
    }

}
