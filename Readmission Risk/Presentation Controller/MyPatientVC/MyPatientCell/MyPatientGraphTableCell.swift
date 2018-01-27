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
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateBarGraphForIndexPath(_ graphDic:Dictionary<String,Any>,indexpath_:IndexPath) {
        
        let val = graphDic["Percentile"]
        
         let hexString = graphDic["Color"] as! String
        
        self.barChart .setNeedsDisplay()
        
        self.barChart.hexStr_ = hexString
        self.barChart.refs = ["10","20","40","20","10"]
        self.barChart.vals = ["10","20","40","20","10"]
        self.barChart.selectedPercentile = Int32("\(val ?? 0)")!
        
        
    }
    
    func updateBarGraphForArrayIndexPath(_ graphDic:Dictionary<String,Any>,indexpath_:IndexPath) {
        
        let val = graphDic["Percentile"]
        
        if let id = graphDic["Percentile"] as? NSNull {
            // don't create the object, 'cuz we can't have a Repository without an id
            print("Got a null id. Check it out: \(id)")
            return
        }
        
        let chartArr = graphDic["Heights"] as? Array<Any>
       // print("Chart",chartArr!)
        
        let hexString = graphDic["Color"] as! String
        
        self.barChart .setNeedsDisplay()
        
//        self.barChart.refs = ["1","2","4","2","1"]
//        self.barChart.vals = ["1","2","4","2","1"]
        
        self.barChart.hexStr_ = hexString
        self.barChart.refs = chartArr!
        self.barChart.vals = chartArr!
        self.barChart.selectedPercentile = Int32("\(val ?? 0)")!
        
    }

}
