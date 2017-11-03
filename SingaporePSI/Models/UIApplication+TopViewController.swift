//
//  UIApplication+TopViewController.swift
//  SingaporePSI
//
//  Created by wiraone on 02/11/17.
//  Copyright © 2017 Wirawan. All rights reserved.
//

import UIKit
import Foundation

extension UIApplication {
    class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        return controller
    }
}
