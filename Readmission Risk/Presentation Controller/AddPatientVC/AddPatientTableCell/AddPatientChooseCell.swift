//
//  AddPatientChooseCell.swift
//  Readmission Risk
//
//  Created by Somdev Choudhary on 12/01/18.
//  Copyright © 2018 Somdev Choudhary. All rights reserved.
//

import UIKit

class AddPatientChooseCell: UITableViewCell {
    
    @IBOutlet weak var as_btn:UIButton!
    @IBOutlet weak var as_TF:RRMaterialTextfield!
    @IBOutlet weak var ai_btn:UIButton!
    @IBOutlet weak var ai_TF:RRMaterialTextfield!
    @IBOutlet weak var ao_btn:UIButton!
    @IBOutlet weak var ao_TF:RRMaterialTextfield!
    @IBOutlet weak var cpaa_btn:UIButton!
    @IBOutlet weak var cpaa_TF:RRMaterialTextfield!
    @IBOutlet weak var cshock_btn:UIButton!
    @IBOutlet weak var cshock_TF:RRMaterialTextfield!
    @IBOutlet weak var clungDisease_btn:UIButton!
    @IBOutlet weak var clungDisease_TF:RRMaterialTextfield!
    @IBOutlet weak var diabetesControl_btn:UIButton!
    @IBOutlet weak var diabetesControl_TF:RRMaterialTextfield!
    @IBOutlet weak var dischargeLoc_btn:UIButton!
    @IBOutlet weak var dischargeLoc_TF:RRMaterialTextfield!
    @IBOutlet weak var incidence_btn:UIButton!
    @IBOutlet weak var incidence_TF:RRMaterialTextfield!
    @IBOutlet weak var mitral_btn:UIButton!
    @IBOutlet weak var mitral_TF:RRMaterialTextfield!
    
    @IBOutlet weak var nodcv_btn:UIButton!
    @IBOutlet weak var nodcv_TF:RRMaterialTextfield!
    @IBOutlet weak var race_btn:UIButton!
    @IBOutlet weak var race_TF:RRMaterialTextfield!
    @IBOutlet weak var resuscitation_btn:UIButton!
    @IBOutlet weak var resuscitation_TF:RRMaterialTextfield!
    @IBOutlet weak var status_btn:UIButton!
    @IBOutlet weak var status_TF:RRMaterialTextfield!
    @IBOutlet weak var tobaccoUse_btn:UIButton!
    @IBOutlet weak var tobaccoUse_TF:RRMaterialTextfield!
    
    @IBOutlet weak var customSubView:UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        as_TF?.setPlaceholderOnMaterialTextField("Admission Source")
        ai_TF?.setPlaceholderOnMaterialTextField("Aortic Insufficiency")
        ao_TF?.setPlaceholderOnMaterialTextField("Aortic Occlusion")
        cpaa_TF?.setPlaceholderOnMaterialTextField("Cardiac Presentation at Admission")
        cshock_TF?.setPlaceholderOnMaterialTextField("Cardiogenic Shock")
        clungDisease_TF?.setPlaceholderOnMaterialTextField("Chronic Lung Disease")
        diabetesControl_TF?.setPlaceholderOnMaterialTextField("Diabetes Control")
        dischargeLoc_TF?.setPlaceholderOnMaterialTextField("Discharge Location")
        incidence_TF?.setPlaceholderOnMaterialTextField("Incidence")
        mitral_TF?.setPlaceholderOnMaterialTextField("Mitral Insufficiency")
        nodcv_TF?.setPlaceholderOnMaterialTextField("Number of Diseased Coronary Vessels")
        race_TF?.setPlaceholderOnMaterialTextField("Race")
        resuscitation_TF?.setPlaceholderOnMaterialTextField("Resuscitation")
        status_TF?.setPlaceholderOnMaterialTextField("Status")
        tobaccoUse_TF?.setPlaceholderOnMaterialTextField("Tobacco Use")
        
        
        customSubView.roundedCellCustomView(8.0, cellCustomView: self.customSubView)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
