//
//  Utility.swift
//  SingaporePSI
//
//  Created by wiraone on 31/10/17.
//  Copyright © 2017 Wirawan. All rights reserved.
//

import UIKit
import Foundation

struct Utility {
    
    static func convertDateToString(_ date: Date, dateFormatForm: String) -> String {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = dateFormatForm
        let toString = dateFormat.string(from: date)
        return toString
    }
    
    static func setCustomNavigationBarFontTheme() {
        UINavigationBar.appearance().titleTextAttributes = [NSFontAttributeName: UIFont.init(name: AppConstant.Font.Name.AvenirNext.regular, size: AppConstant.Font.Size.big)!, NSForegroundColorAttributeName:UIColor.black]
    }
    
    static func showAlert(with error: PSIErrorHandler, activeViewController: UIViewController) {
        let alert = UIAlertController.init(title: error.errorTitle, message: error.errorMessage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
            UIAlertAction in
        }
        alert.addAction(okAction)
        activeViewController.present(alert, animated: true, completion: nil)
    }
    
    static func setFont(_ name: String, size: CGFloat) -> UIFont? {
        return UIFont.init(name: name, size: size)
    }
    
    static func isRegionNameNational(name: String) -> Bool {
        if name == AppConstant.JSONKey.Content.national {
            return true
        }
        return false
    }
    
    static func convertRegiontoDirection(regionName: String) -> Direction {
        if Direction.north.rawValue == regionName {
            return .north
        }
        else if Direction.south.rawValue == regionName {
            return .south
        }
        else if Direction.west.rawValue == regionName {
            return .west
        }
        else if Direction.east.rawValue == regionName {
            return .east
        }
        else {
            return .center
        }
    }
    
    static func setHazardousColorFrom(_ value: Double) -> UIColor {
        
        switch value {
        case 0...50:
            return .green
        case 51...100:
            return .blue
        case 101...200:
            return .yellow
        case 201...300:
            return .orange
        default:
            return .red
        }
    }
}
