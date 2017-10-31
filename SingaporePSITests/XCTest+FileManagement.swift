//
//  XCTest+FileManagement.swift
//  SingaporePSI
//
//  Created by wiraone on 31/10/17.
//  Copyright © 2017 Wirawan. All rights reserved.
//

import XCTest
import Gloss

extension XCTestCase {
    
    func loadJSONPayload(fileName: String) -> JSON? {
        
        if let path = Bundle(for: type(of: self)).path(forResource: fileName, ofType: "json") {
            do {
                let jsonData = try NSData(contentsOfFile: path, options: NSData.ReadingOptions.mappedIfSafe)
                do {
                    let jsonResult: NSDictionary = try JSONSerialization.jsonObject(with: jsonData as Data, options: .mutableContainers) as! NSDictionary
                        return jsonResult as! JSON
                } catch {
                        print("json not valid")
                }
            } catch {
                print("path not valid")
            }
        }
        else {
            print("path not found")
        }
        return nil
    }
}
