//
//  AddPatientSliderCell.swift
//  Readmission Risk
//
//  Created by Somdev Choudhary on 09/12/17.
//  Copyright © 2017 Somdev Choudhary. All rights reserved.
//

import UIKit

class AddPatientSliderCell: UITableViewCell {
    
    @IBOutlet weak var customSubView:UIView!
    @IBOutlet weak var creatinine_Slider:RRLevelSlider!
    @IBOutlet weak var creatinine_View:UIView!
    @IBOutlet weak var creatininePer_Lbl:UILabel?
    @IBOutlet weak var creatinineQuantity_Lbl:UILabel?
    
    @IBOutlet weak var ejection_Slider:RRLevelSlider!
    @IBOutlet weak var ejection_View:UIView!
    @IBOutlet weak var ejectionPer_Lbl:UILabel?
    @IBOutlet weak var ejectionQuantity_Lbl:UILabel?
    
    @IBOutlet weak var perfusion_Slider:RRLevelSlider!
    @IBOutlet weak var perfusion_View:UIView!
    @IBOutlet weak var perfusionPer_Lbl:UILabel?
    @IBOutlet weak var perfusionQuantity_Lbl:UILabel?
    
    @IBOutlet weak var cross_Slider:RRLevelSlider!
    @IBOutlet weak var cross_View:UIView!
    @IBOutlet weak var crossPer_Lbl:UILabel?
    @IBOutlet weak var crossQuantity_Lbl:UILabel?
    
    @IBOutlet weak var last_Slider:RRLevelSlider!
    @IBOutlet weak var last_View:UIView!
    @IBOutlet weak var lastPer_Lbl:UILabel?
    @IBOutlet weak var lastQuantity_Lbl:UILabel?
    
    @IBOutlet weak var post_Slider:RRLevelSlider!
    @IBOutlet weak var post_View:UIView!
    @IBOutlet weak var postPer_Lbl:UILabel?
    @IBOutlet weak var postQuantity_Lbl:UILabel?
    

    override func awakeFromNib() {
        super.awakeFromNib()
        customSubView.roundedCellCustomView(8.0, cellCustomView: self.customSubView)
        
        creatinine_View.setBorderColorAndCorner(4.0, cellCustomView: self.creatinine_View)
        ejection_View.setBorderColorAndCorner(4.0, cellCustomView: self.ejection_View)
        perfusion_View.setBorderColorAndCorner(4.0, cellCustomView: self.perfusion_View)
        cross_View.setBorderColorAndCorner(4.0, cellCustomView: self.cross_View)
        last_View.setBorderColorAndCorner(4.0, cellCustomView: self.last_View)
        post_View.setBorderColorAndCorner(4.0, cellCustomView: self.post_View)

        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
