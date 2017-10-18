//
//  DashboardViewController.swift
//  SingaporePSI
//
//  Created by wiraone on 18/10/17.
//  Copyright © 2017 Wirawan. All rights reserved.
//

import UIKit
import MapKit

class DashboardViewController: UIViewController {
    
    //MARK: - Properties
    @IBOutlet weak var mapView: MKMapView!
    
    //MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupMapView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
}

//MARK: - Private Method
extension DashboardViewController {
    fileprivate func setupMapView() {
        
    }
}

//MARK: - MKMapViewDelegate
extension DashboardViewController: MKMapViewDelegate {
    
}
