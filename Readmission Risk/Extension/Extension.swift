//
//  Extension.swift
//  Readmission Risk
//
//  Created by Somdev Choudhary on 09/12/17.
//  Copyright © 2017 Somdev Choudhary. All rights reserved.
//

import Foundation
import UIKit

extension UIView
{
    
    func roundedCellCustomView(_ cornerRadius:CGFloat, cellCustomView:UIView) {
        
        cellCustomView.layer.cornerRadius = cornerRadius
        cellCustomView.layer.masksToBounds = true
        
    }
    
    func setBorderColorAndCorner(_ cornerRadius:CGFloat, cellCustomView:UIView) {
        
        cellCustomView.layer.cornerRadius = cornerRadius
        cellCustomView.layer.borderWidth = 1.0
        cellCustomView.layer.borderColor = UIColor.lightGray.cgColor
        cellCustomView.layer.masksToBounds = true
    }
    func setButtonBorderColorAndCorner(_ cornerRadius:CGFloat, btn:UIButton) {
        
        btn.layer.cornerRadius = cornerRadius
        btn.layer.borderWidth = 1.0
        btn.layer.borderColor = UIColor.lightGray.cgColor
        btn.layer.masksToBounds = true
    }
    
}

