//
//  InputFormSpec.swift
//  SingaporePSI
//
//  Created by wiraone on 31/10/17.
//  Copyright © 2017 Wirawan. All rights reserved.
//

import Quick
import Nimble

@testable import SingaporePSI

class InputFormSpec: QuickSpec {
    
    override func spec() {
        var inputForm: InputForm?
        var isInputValid: Bool = false
        
        describe("Validate input form data") {
            beforeEach {
                inputForm = InputForm()
            }
            
            context("when input form initialize") {
                it("should have empty date, date time empty and error message not empty") {
                    expect(inputForm?.date.isEmpty).to(beTrue())
                    expect(inputForm?.dateTime.isEmpty).to(beTrue())
                    expect(inputForm?.errorMessage).to(equal(AppConstant.Validation.emptyDate))
                }
            }
        }
        
        describe("Validate input form data") {
            beforeEach {
                inputForm = InputForm()
                inputForm?.date = Utility.convertDateToString(Date(), dateFormatForm: AppConstant.DateFormat.defaultDateTime)
                inputForm?.dateTime = Utility.convertDateToString(Date(), dateFormatForm: AppConstant.DateFormat.defaultDateTime)
                isInputValid = inputForm!.isValid()
            }
            
            context("when input form date has been set") {
                
                it("should have valid input form") {
                    expect(inputForm?.date.isEmpty).to(beFalse())
                    expect(inputForm?.dateTime.isEmpty).to(beFalse())
                    expect(isInputValid).to(beTrue())
                }
            }
        }
    }
}
