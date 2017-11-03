//
//  UtilitySpec.swift
//  SingaporePSI
//
//  Created by wiraone on 31/10/17.
//  Copyright © 2017 Wirawan. All rights reserved.
//

import UIKit
import Quick
import Nimble

@testable import SingaporePSI

class UtilitySpec: QuickSpec {
    
    override func spec() {
        var dateString: String = AppConstant.Default.emptyString
        var goodTypeColor: UIColor?
        var moderateTypeColor: UIColor?
        var unhealthyTypeColor: UIColor?
        var veryUnhealthyTypeColor: UIColor?
        var hazardousTypeColor: UIColor?
        
        
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
        
        describe("Validate color pin base on psi 24 hour value") {
            beforeEach {
                goodTypeColor = Utility.setHazardousColorFrom(50)
                moderateTypeColor = Utility.setHazardousColorFrom(51)
                unhealthyTypeColor = Utility.setHazardousColorFrom(101)
                veryUnhealthyTypeColor = Utility.setHazardousColorFrom(201)
                hazardousTypeColor = Utility.setHazardousColorFrom(301)
            }
            
            context("when first value converted to color criteria") {
                it("should have correct color criteria") {
                    expect(goodTypeColor == .green).to(beTrue())
                    expect(moderateTypeColor == .blue).to(beTrue())
                    expect(unhealthyTypeColor == .yellow).to(beTrue())
                    expect(veryUnhealthyTypeColor == .orange).to(beTrue())
                    expect(hazardousTypeColor == .red).to(beTrue())
                }
            }
        }
    }
}
