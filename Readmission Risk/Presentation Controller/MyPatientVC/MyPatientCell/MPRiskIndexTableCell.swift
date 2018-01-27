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

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateRiskIndexBarGraph(_ graphDic:Dictionary<String,Any>) {

        let val = graphDic["Percentile"]
        let hexString = graphDic["Color"] as! String
        self.barChart .setNeedsDisplay()
        
        self.barChart.hexStr_ = hexString
        barChart.refs = ["1","2","3","2","1"]
        barChart.vals = ["1","2","3","2","1"]
        barChart.selectedPercentile = Int32("\(val ?? 0)")!
    }

}
