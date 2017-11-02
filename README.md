# SingaporePSI

App that show Pollutant Standards Index on Singapore
The PSI considers six air pollutants - sulphur dioxide (SO2), particulate matter (PM10), fine particulate matter (PM2.5), nitrogen dioxide (NO2), carbon monoxide (CO) and ozone (O3).

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

What things you need to install the software and how to install them

```
Xcode 8.3.3
Cocoapod 1.3.1 (I used this version but you can use legacy version too)
```

### Installing

A step by step series of examples that tell you have to get a development env running

After finish download the project please open file SingaporePSI.xcworkspace

run using xcode 8.3.3 using swift 3

End with an example of getting some data out of the system or using it for a little demo

## Running the tests

To run unit testing just use command + U

### UI Component Test

This test purposed to make sure initial UI component loaded on view controller, using Quick the test code is like these :

```
import Quick
import Nimble

@testable import SingaporePSI

class DashboardViewControllerSpec: QuickSpec {
    
    override func spec() {
        var subject: DashboardViewController!
        
        describe("DashboardViewControllerSpec") {
            beforeEach {
                subject = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DashboardViewController") as! DashboardViewController
                _ = subject.view
            }
        
            context("when view is loaded") {
                it("should have empty search bar text") {
                    expect(subject.searchBar.text?.isEmpty).to(beTrue())
                }
            }
            
            context("when view is loaded") {
                it("should have map view") {
                    expect(subject.mapView != nil).to(beTrue())
                }
            }      
        }
    }
}
```

### Network Test

This test purposed to make sure initial UI component loaded on view controller, using Quick the test code is like these :

```
import Quick
import Nimble

@testable import SingaporePSI

class ApiManagerSpec: QuickSpec {
    
    var psiData: PSIData?
    var psiErrorHandler: PSIErrorHandler?
    
    override func spec() {
        describe("API") {
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
```

## Built With

* [Alamofire](https://github.com/Alamofire/Alamofire) - HTTP networking library written in Swift.
* [Cocoapod](https://cocoapods.org) - Dependency Management
* [Gloss](https://github.com/hkellaway/Gloss) - Used to JSON parsing
* [NVActivityIndicatorView](https://github.com/ninjaprox/NVActivityIndicatorView) - Used to show activity indicator
* [Quick](https://github.com/Quick/Nimble) - Used for unit testing matcher
* [Nimble](https://github.com/Quick/Nimble) - Used for unit testing matcher
* [Mockingjay](https://github.com/kylef/Mockingjay) - library for stubbing HTTP requests with ease in Swift 

## Authors

* **Wirawan** 
