//
//  MyPatientNameCC.swift
//  Readmission Risk
//
//  Created by Somdev Choudhary on 15/12/17.
//  Copyright © 2017 Somdev Choudhary. All rights reserved.
//

import UIKit

class MyPatientNameCC: UICollectionViewCell {
    
    @IBOutlet weak var patientName:UILabel?
    @IBOutlet weak var cellSubView:UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cellSubView.setBorderColorAndCorner(8.0, cellCustomView: self.cellSubView);
    }
    
}
