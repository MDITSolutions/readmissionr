//
//  MPRiskIndexTableCell.swift
//  Readmission Risk
//
//  Created by Somdev Choudhary on 17/12/17.
//  Copyright © 2017 Somdev Choudhary. All rights reserved.
//

import UIKit

class MPRiskIndexTableCell: UITableViewCell {
    @IBOutlet weak var barChart:DSBarChart!
    @IBOutlet weak var headingTitle:UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        barChart.refs = ["M","T","W","Th","F"]
        barChart.vals = ["10","20","300","140","200"]
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
