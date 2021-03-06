//
//  ErrorHandler.swift
//  SingaporePSI
//
//  Created by wiraone on 31/10/17.
//  Copyright © 2017 Wirawan. All rights reserved.
//

import UIKit
import Foundation
import Gloss

class PSIErrorHandler {
    var errorTitle: String?
    var errorMessage: String?
    var errorCode: Int?
    
    init() {
        errorTitle = AppConstant.Default.title
        errorMessage = AppConstant.Default.emptyString
        errorCode = AppConstant.ErrorCode.undefined
    }
    
    init(with error: Error) {
        errorTitle = AppConstant.Default.title
        errorMessage = error.localizedDescription
        errorCode = AppConstant.ErrorCode.undefined
    }
}
