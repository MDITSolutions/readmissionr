//
//  RRLevelSlider.swift
//  Readmission Risk
//
//  Created by Somdev Choudhary on 09/12/17.
//  Copyright © 2017 Somdev Choudhary. All rights reserved.
//

import UIKit

class RRLevelSlider: UISlider {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBInspectable var trackHeight: CGFloat = 12
    
    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        
       // return CGRect(origin: bounds.origin, size: CGSize(width: bounds.width, height: trackHeight))
        
        return CGRect(x:bounds.origin.x,y:10, width: bounds.width, height: trackHeight)

    }

}
