//
//  MPRiskFactsTableCell.swift
//  Readmission Risk
//
//  Created by Somdev Choudhary on 17/12/17.
//  Copyright © 2017 Somdev Choudhary. All rights reserved.
//

import UIKit

class MPRiskFactsTableCell: UITableViewCell {
    
    @IBOutlet weak var factCollection:UICollectionView!
    @IBOutlet weak var headingTitle:UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCollectionViewDataSourceAndDelegate<D:UICollectionViewDataSource & UICollectionViewDelegate>(_ dataSourceDelegate:D, forRow row:Int)
    {
        factCollection.delegate = dataSourceDelegate
        factCollection.dataSource = dataSourceDelegate
        factCollection.tag = row
        factCollection.reloadData()
    }


}
