//
//  CustomAnnotationView.swift
//  SingaporePSI
//
//  Created by wiraone on 01/11/17.
//  Copyright © 2017 Wirawan. All rights reserved.
//

import UIKit
import MapKit

class CustomAnnotation: MKPointAnnotation {
    var annotations = [MKAnnotation]()
}

class CustomAnnotationView: MKAnnotationView {
    open lazy var countLabel: UILabel = {
        let label = UILabel()
        label.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        label.backgroundColor = .clear
        label.font = Utility.setFont(AppConstant.Font.Name.AvenirNext.regular, size: AppConstant.Font.Size.regular)
        label.textColor = .white
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 2
        label.baselineAdjustment = .alignCenters
        self.addSubview(label)
        return label
    }()
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        configure(with: nil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func configure(with data: PSIData?) {
        guard let _ = annotation as? CustomAnnotation else { return }
        
        backgroundColor = UIColor.black
        let diameter = AppConstant.Map.annotationRadius * 2
        frame = CGRect(origin: frame.origin, size: CGSize(width: diameter, height: diameter))
        countLabel.text = "100"
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()

        layer.masksToBounds = true
        layer.cornerRadius = image == nil ? bounds.width / 2 : 0
        countLabel.frame = bounds
    }
}
