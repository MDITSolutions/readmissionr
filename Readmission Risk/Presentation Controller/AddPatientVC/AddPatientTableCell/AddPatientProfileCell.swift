//
//  AddPatientProfileCell.swift
//  Readmission Risk
//
//  Created by Somdev Choudhary on 08/12/17.
//  Copyright © 2017 Somdev Choudhary. All rights reserved.
//

import UIKit

class AddPatientProfileCell: UITableViewCell {
    
    @IBOutlet weak var name_TF:RRMaterialTextfield?
    @IBOutlet weak var age_TF:RRMaterialTextfield?
    @IBOutlet weak var dob_TF:RRMaterialTextfield?
    @IBOutlet weak var gender_TF:RRMaterialTextfield?
    @IBOutlet weak var height_TF:RRMaterialTextfield?
    @IBOutlet weak var weight_TF:RRMaterialTextfield?
    @IBOutlet weak var arrivalDate_TF:RRMaterialTextfield?
    @IBOutlet weak var surgeryDate_TF:RRMaterialTextfield?
    @IBOutlet weak var skinCutStartTime_TF:RRMaterialTextfield?
    @IBOutlet weak var skinCutStopTime_TF:RRMaterialTextfield?
    @IBOutlet weak var customSubView:UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        customSubView.roundedCellCustomView(8.0, cellCustomView: self.customSubView);
        
        name_TF?.setPlaceholderOnMaterialTextField("Last Name, First Name")
        age_TF?.setPlaceholderOnMaterialTextField("Age")
        dob_TF?.setPlaceholderOnMaterialTextField("Date of Birth")
        gender_TF?.setPlaceholderOnMaterialTextField("Gender")
        height_TF?.setPlaceholderOnMaterialTextField("Height")
        weight_TF?.setPlaceholderOnMaterialTextField("Weight")
        arrivalDate_TF?.setPlaceholderOnMaterialTextField("Arrival Date")
        surgeryDate_TF?.setPlaceholderOnMaterialTextField("Surgery Date")
        skinCutStartTime_TF?.setPlaceholderOnMaterialTextField("Skin Cut Start Time")
        skinCutStopTime_TF?.setPlaceholderOnMaterialTextField("Skin Cut Stop Time")
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
