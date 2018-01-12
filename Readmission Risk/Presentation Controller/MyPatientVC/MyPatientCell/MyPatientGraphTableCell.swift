//
//  MyPatientGraphTableCell.swift
//  Readmission Risk
//
//  Created by Somdev Choudhary on 16/12/17.
//  Copyright © 2017 Somdev Choudhary. All rights reserved.
//

import UIKit

class MyPatientGraphTableCell: UITableViewCell {
    
    @IBOutlet weak var headingTitle:UILabel?
    @IBOutlet weak var quantity_Lbl:UILabel?
    @IBOutlet weak var barChart:DSBarChart!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
//        let dsBarChart = DSBarChart.init(frame: barChart.bounds, color: UIColor.yellow, references: ["M","T","W","Th","F"], andValues: ["10","20","300","140","200"])
//
//        dsBarChart!.autoresizingMask = [.flexibleWidth , .flexibleHeight]
//        dsBarChart!.bounds = barChart.bounds
//
//        barChart .addSubview(dsBarChart!)
        
        barChart.refs = ["M","T","W","Th","F"]
        barChart.vals = ["10","20","300","140","200"]
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
