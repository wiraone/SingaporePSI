//
//  String+DateFormatter.swift
//  SingaporePSI
//
//  Created by wiraone on 03/11/17.
//  Copyright © 2017 Wirawan. All rights reserved.
//

import Nimble
import Quick

@testable import SingaporePSI

class StringDateFormatterSpec: QuickSpec {
    
    override func spec() {
        var validDateString: String = "2017-11-03T08:06:19+08:00"
        var notValidDateString: String = ""
        
        describe("Validate date string have clean date format") {
            beforeEach {
                validDateString = validDateString.cleanDateFormat()
                notValidDateString = notValidDateString.cleanDateFormat()
            }
            
            context("when date converted to clean string") {
                it("should have correct clean string date value") {
                    expect(validDateString).to(equal("2017-11-03 08:06:19"))
                }
            }
            
            context("when date converted to clean string") {
                it("should have correct clean string date value") {
                    expect(notValidDateString).to(equal(AppConstant.Default.emptyString))
                }
            }
        }
    }
}
