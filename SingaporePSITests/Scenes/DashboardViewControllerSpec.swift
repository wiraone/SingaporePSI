//
//  SingaporePSITests.swift
//  SingaporePSITests
//
//  Created by wiraone on 18/10/17.
//  Copyright © 2017 Wirawan. All rights reserved.
//

import Quick
import Nimble

@testable import SingaporePSI

class DashboardViewControllerSpec: QuickSpec {
    
    override func spec() {
        var subject: DashboardViewController!
        
        describe("Check UI Component Exist") {
            beforeEach {
                subject = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DashboardViewController") as! DashboardViewController
                _ = subject.view
            }
        
            context("when view is loaded") {
                it("should have map view") {
                    expect(subject.mapView != nil).to(beTrue())
                }
            }
        }
    }
}
