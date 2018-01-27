//
//  MyPatientRiskTableCell.swift
//  Readmission Risk
//
//  Created by Somdev Choudhary on 16/12/17.
//  Copyright © 2017 Somdev Choudhary. All rights reserved.
//

import UIKit

class MyPatientRiskTableCell: UITableViewCell {
    
    @IBOutlet weak var headingTitle:UILabel?
    @IBOutlet weak var buttonView:UIView!
    @IBOutlet weak var highBtn:UIButton!
    @IBOutlet weak var mediumBtn:UIButton!
    @IBOutlet weak var lowBtn:UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        buttonView.setBorderColorAndCorner(4.0, cellCustomView: self.buttonView)
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updatePatientRisk(_ profileDic:Dictionary<String,Any>) {
        
        if let riskStr = profileDic["Readmission Risk Rating"] as? String
        {
            if riskStr == "Amber"
            {
                // Medium
                self.mediumBtn.backgroundColor = UIColor.init(red: 248/255, green: 198/255, blue: 55/255, alpha: 1)
                
                self.lowBtn.backgroundColor = UIColor.init(red: 235/255, green: 235/255, blue: 241/255, alpha: 1)
                self.highBtn.backgroundColor = UIColor.init(red: 235/255, green: 235/255, blue: 241/255, alpha: 1)
                
                
            }
            else if riskStr == "Red"
            {
                self.mediumBtn.backgroundColor = UIColor.init(red: 231/255, green: 231/255, blue: 238/255, alpha: 1)
                self.lowBtn.backgroundColor = UIColor.init(red: 231/255, green: 231/255, blue: 238/255, alpha: 1)
                
                // High
                self.highBtn.backgroundColor = UIColor.red
                
            }
            else
            {
                self.mediumBtn.backgroundColor = UIColor.init(red: 231/255, green: 231/255, blue: 238/255, alpha: 1)
                // Low
                self.lowBtn.backgroundColor = UIColor.init(red: 191/255, green: 233/255, blue: 86/255, alpha: 1)
                
                self.highBtn.backgroundColor = UIColor.init(red: 193/255, green: 57/255, blue: 41/255, alpha: 1)
            }
        }
        
    }

}
