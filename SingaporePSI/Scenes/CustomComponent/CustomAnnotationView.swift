//
//  CustomAnnotationView.swift
//  SingaporePSI
//
//  Created by wiraone on 01/11/17.
//  Copyright © 2017 Wirawan. All rights reserved.
//

import UIKit
import MapKit


enum Direction: String {
    case north = "north"
    case south = "south"
    case west = "west"
    case east = "east"
    case center = "center"
}

class CustomAnnotation: MKPointAnnotation {
    var direction: Direction = .center
    var annotations = [MKAnnotation]()
}

class CustomAnnotationView: MKAnnotationView {
    open lazy var countLabel: UILabel = {
        let label = UILabel()
        label.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        label.backgroundColor = .clear
        label.font = Utility.setFont(AppConstant.Font.Name.AvenirNext.regular, size: AppConstant.Font.Size.regular)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 2
        label.baselineAdjustment = .alignCenters
        self.addSubview(label)
        return label
    }()
    
    public init(annotation: MKAnnotation?, reuseIdentifier: String?, data: PSIData?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        configure(with: data)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func configure(with data: PSIData?) {
        guard let customAnnotation = annotation as? CustomAnnotation else { return }
        
        backgroundColor = .white
        let diameter = AppConstant.Map.annotationRadius * 2
        frame = CGRect(origin: frame.origin, size: CGSize(width: diameter, height: diameter))
        switch customAnnotation.direction {
        case .north:
            let value = data?.items?.last?.readings?.psiTwentyFourHourly?.north ?? AppConstant.Default.emptyNumber
            countLabel.textColor = Utility.setHazardousColorFrom(value)
            countLabel.text = String.init(describing: value)
            break
        case .south:
            let value = data?.items?.last?.readings?.psiTwentyFourHourly?.south ?? AppConstant.Default.emptyNumber
            countLabel.textColor = Utility.setHazardousColorFrom(value)
            countLabel.text = String.init(describing: value)
            break
        case .west:
            let value = data?.items?.last?.readings?.psiTwentyFourHourly?.west ?? AppConstant.Default.emptyNumber
            countLabel.textColor = Utility.setHazardousColorFrom(value)
            countLabel.text = String.init(describing: value)
            break
        case .east:
            let value = data?.items?.last?.readings?.psiTwentyFourHourly?.east ?? AppConstant.Default.emptyNumber
            countLabel.textColor = Utility.setHazardousColorFrom(value)
            countLabel.text = String.init(describing: value)
            break
        case .center:
            let value = data?.items?.last?.readings?.psiTwentyFourHourly?.central ?? AppConstant.Default.emptyNumber
            countLabel.textColor = Utility.setHazardousColorFrom(value)
            countLabel.text = String.init(describing: value)
            break
        }        
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()

        layer.masksToBounds = true
        layer.cornerRadius = image == nil ? bounds.width / 2 : 0
        countLabel.frame = bounds
    }
}
