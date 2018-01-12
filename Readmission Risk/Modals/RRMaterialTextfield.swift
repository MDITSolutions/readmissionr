//
//  RRMaterialTextfield.swift
//  Readmission Risk
//
//  Created by Somdev Choudhary on 08/12/17.
//  Copyright © 2017 Somdev Choudhary. All rights reserved.
//

import UIKit
import JJMaterialTextField

class RRMaterialTextfield: JJMaterialTextfield {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    func setPlaceholderOnMaterialTextField(_ placeholderText:String) {
        placeholder = placeholderText
        enableMaterialPlaceHolder = true
    }

}
