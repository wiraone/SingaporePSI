//
//  DashboardViewController.swift
//  SingaporePSI
//
//  Created by wiraone on 18/10/17.
//  Copyright © 2017 Wirawan. All rights reserved.
//

import UIKit
import MapKit
import Alamofire
import NVActivityIndicatorView

class DashboardViewController: UIViewController {
    
    //MARK: - Properties
    /**
         mapview outlet to show map on controller
         activity indicator data is for network loading indicator
         request is alamofire request for make request to server
     */
    @IBOutlet weak var mapView: MKMapView!
    var activityIndicatorData: ActivityData?
    var request: Request?
    
    
    //MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = AppConstant.Default.title
        setupActivityIndicator()
        centerMapView()
        fetchPSIData()
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
    fileprivate func setupActivityIndicator() {
        let activityIndicatorSize = CGSize(width: 30, height: 30)
        activityIndicatorData = ActivityData.init(size: activityIndicatorSize, message: nil, messageFont: nil, type: .ballGridPulse, color: UIColor.black, padding: nil, displayTimeThreshold: nil, minimumDisplayTime: nil, backgroundColor: UIColor.clear, textColor: nil)
    }
    
    fileprivate func centerMapView() {
        let initialLocation = CLLocation(latitude: AppConstant.Map.Center.latitude, longitude: AppConstant.Map.Center.longitude)
        centerMapOnLocation(location: initialLocation)
    }
    
    fileprivate func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  AppConstant.Map.regionRadius, AppConstant.Map.regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
}

//MARK: - MKMapViewDelegate
extension DashboardViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
    
        if let annotation = annotation as? CustomAnnotation {
            let identifier = "Annotation"
            var view = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
           
            if let view = view as? CustomAnnotationView {
                view.annotation = annotation
                view.configure(with: nil)
            } else {
                view = CustomAnnotationView.init(annotation: annotation, reuseIdentifier: identifier)
            }
            return view
        }
        return nil
    }
}

//MARK: - API
extension DashboardViewController {
    fileprivate func fetchPSIData() {
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityIndicatorData!)
        
        let inputForm = InputForm()
        self.request = APIManager.sharedInstance.fetchPSIData(param: inputForm, completion: { (data, error) in
            
            self.request = nil
            NVActivityIndicatorPresenter.sharedInstance.stopAnimating()
            
            if let errorValid = error {
                print(errorValid)
                Utility.showAlert(with: errorValid, activeViewController: self)
                
            } else {
                guard let regions = data?.regionMetadata else {
                    return
                }
                
                for region in regions {
                    let pointAnnotation = CustomAnnotation()
                    let latitude = region.location?.latitude ?? AppConstant.Default.emptyNumber
                    let longitude = region.location?.longitude ?? AppConstant.Default.emptyNumber
                    
                    pointAnnotation.title = region.name
                    pointAnnotation.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                    
                    let pinAnnotationView = MKPinAnnotationView(annotation: pointAnnotation, reuseIdentifier: nil)
                    self.mapView.addAnnotation(pinAnnotationView.annotation!)
                }
                
                self.mapView.showAnnotations(self.mapView.annotations, animated: true)
                self.centerMapView()
            }
        })
    }
}

//MARK: - Action Button

extension DashboardViewController {
    @IBAction fileprivate func didTapCalendarButton(sender: UIButton) {
        
    }
}
