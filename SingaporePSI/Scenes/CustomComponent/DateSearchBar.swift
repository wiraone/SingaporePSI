//
//  DateSearchBar.swift
//  SingaporePSI
//
//  Created by wiraone on 31/10/17.
//  Copyright © 2017 Wirawan. All rights reserved.
//

import UIKit

protocol DateSearchBarDelegate {
    func searchPSIOnDate(_ date: String)
}

class DateSearchBar: UISearchBar {
    
}

extension DateSearchBar: UISearchBarDelegate {
    fileprivate func addToolBar() {
    
    }
    
    fileprivate func showDatePicker(_ datePickerMode: UIDatePickerMode) {
        let datePicker = UIDatePicker.init()
        
        datePicker.datePickerMode = datePickerMode
        datePicker.date = Date.init()
        datePicker.addTarget(self, action: #selector(self.datePickerValueChanged), for: UIControlEvents.valueChanged)
        
    }
    
    func datePickerValueChanged(sender: UIDatePicker) {
        self.text = Utility.convertDateToString(sender.date, dateFormatForm: AppConstant.DateFormat.date)
    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        showDatePicker(.dateAndTime)
        return false
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
}
