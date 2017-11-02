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
    @IBOutlet weak var dateLabel: UILabel!
    
    var activityIndicatorData: ActivityData?
    var request: Request?
    var psiData: PSIData?
    
    
    //MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = AppConstant.Default.navigationBarTitle
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
        let activityIndicatorSize = CGSize(width: AppConstant.Default.activityIndicatorSize, height: AppConstant.Default.activityIndicatorSize)
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
                view.configure(with: self.psiData)
            } else {
                view = CustomAnnotationView.init(annotation: annotation, reuseIdentifier: identifier, data: self.psiData)
            }
            
            return view
        }
        return nil
    }
}

//MARK: - API
extension DashboardViewController {
    
    fileprivate func addAnnotationtoMapView(data: PSIData?) {
        guard let regions = data?.regionMetadata else {
            return
        }
        
        psiData = data
        
        for region in regions {
            if Utility.isRegionNameNational(name: region.name ?? AppConstant.Default.emptyString) == false {
                let pointAnnotation = CustomAnnotation()
                let latitude = region.location?.latitude ?? AppConstant.Default.emptyNumber
                let longitude = region.location?.longitude ?? AppConstant.Default.emptyNumber
                
                pointAnnotation.title = region.name
                pointAnnotation.direction = Utility.convertRegiontoDirection(regionName: region.name ?? AppConstant.Default.emptyString)
                pointAnnotation.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                
                let pinAnnotationView = MKPinAnnotationView(annotation: pointAnnotation, reuseIdentifier: nil)
                self.mapView.addAnnotation(pinAnnotationView.annotation!)
            }
        }
        
        mapView.showAnnotations(self.mapView.annotations, animated: true)
        
    }
    
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
                self.addAnnotationtoMapView(data: data)
                self.dateLabel.text = (String.init(format: "Last updated\n %@", data?.items?.last?.updateTimestamp?.cleanDateFormat() ?? AppConstant.Default.emptyString))
            }
        })
    }
}

//MARK: - Action Button

extension DashboardViewController {
    @IBAction fileprivate func didTapRefreshButton(sender: UIBarButtonItem) {
        mapView.removeAnnotations(mapView.annotations)
        fetchPSIData()
    }
}
