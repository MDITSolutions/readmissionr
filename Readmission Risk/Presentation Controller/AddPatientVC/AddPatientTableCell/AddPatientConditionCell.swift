//
//  AddPatientConditionCell.swift
//  Readmission Risk
//
//  Created by Somdev Choudhary on 10/12/17.
//  Copyright © 2017 Somdev Choudhary. All rights reserved.
//

import UIKit

class AddPatientConditionCell: UITableViewCell {
    @IBOutlet weak var customSubView:UIView!
    @IBOutlet weak var conditionCollection:UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        customSubView.roundedCellCustomView(8.0, cellCustomView: self.customSubView);
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCollectionViewDataSourceAndDelegate<D:UICollectionViewDataSource & UICollectionViewDelegate>(_ dataSourceDelegate:D, forRow row:Int)
    {
        conditionCollection.delegate = dataSourceDelegate
        conditionCollection.dataSource = dataSourceDelegate
        conditionCollection.tag = row
        conditionCollection.reloadData()
    }

}
