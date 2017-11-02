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
}
