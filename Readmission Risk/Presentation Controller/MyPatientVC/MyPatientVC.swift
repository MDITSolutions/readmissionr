//
//  MyPatientVC.swift
//  Readmission Risk
//
//  Created by Somdev Choudhary on 12/12/17.
//  Copyright © 2017 Somdev Choudhary. All rights reserved.
//

import UIKit

class MyPatientVC: UIViewController {
    
    @IBOutlet weak var patientSCV:UIView!
    @IBOutlet weak var patientBioView:UIView!
    @IBOutlet weak var graphView:UIView!
    @IBOutlet weak var riskView:UIView!
    @IBOutlet weak var patientCollection:UICollectionView!
    @IBOutlet weak var myPatientBtn:UIButton!
    @IBOutlet weak var searchBtn:UIButton!
    @IBOutlet weak var editBtn:UIButton!
    
    @IBOutlet weak var graphTable:UITableView!
    var graphArr:Array<String>! = []
    var riskFactsArr:Array<String>! = []
    @IBOutlet weak var riskTable:UITableView!
    
    var patientNameArr:Array<String>! = []
    
    var  selectedIndexPath : IndexPath?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBtn.setButtonBorderColorAndCorner(4.0, btn: searchBtn)
        patientBioView.setBorderColorAndCorner(8.0, cellCustomView: patientBioView)
        graphView.setBorderColorAndCorner(8.0, cellCustomView: graphView)
        riskView.setBorderColorAndCorner(8.0, cellCustomView: riskView)
        
        patientNameArr = ["Conger,Yiwen","Mao,Yiwen","Conger,Yiwen","Mao,Yiwen","Conger,Yiwen","Mao,Yiwen","Conger,Yiwen","Mao,Yiwen","Conger,Yiwen","Mao,Yiwen","Conger,Yiwen","Mao,Yiwen"]
        
        graphArr = ["Age","Weight","Last Creatinine Level","Ejection Fraction","Perfusion Time","Cross Clamp Time","Last A1C Level","Post-Operative Ventilation Time"]
        
        riskFactsArr = ["Valve","Diabetes","Complications","Intra-Aortic Blood Pump","Blood Bank Products Used","Intra-Operative Blood Products Used"]

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MyPatientVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView.tag == 101
        {
           return patientNameArr.count
        }
        else
        {
            return riskFactsArr.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView.tag == 101
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyPatientNameCC", for: indexPath) as! MyPatientNameCC
            
            cell.patientName?.text = patientNameArr[indexPath.item]
            
            if selectedIndexPath != nil && indexPath == selectedIndexPath {
                cell.cellSubView.backgroundColor = UIColor.white
                
            }else{
                
               cell.cellSubView.backgroundColor = UIColor.init(red: 235/255, green: 235/255, blue: 241/255, alpha: 1)
            }
            
            return cell
        }
        else
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MPRiskFactsCC", for: indexPath) as! MPRiskFactsCC
            
            cell.fact_Lbl?.text = riskFactsArr[indexPath.item]
            return cell
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView.tag == 101
        {
            return CGSize(width:collectionView.frame.size.width/5-2,height:50)
        }
        else
        {
            return CGSize(width:collectionView.frame.size.width,height:30)

        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView.tag == 101
        {
            selectedIndexPath = indexPath
            patientCollection.reloadData()
        }
        
    }
}

extension MyPatientVC:UITableViewDataSource,UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == graphTable
        {
            return graphArr.count
        }
        else
        {
            return 3
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == graphTable
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyPatientGraphTableCell", for: indexPath) as! MyPatientGraphTableCell
           
            cell.headingTitle?.text = graphArr[indexPath.row]
            
            return cell
        }
        else
        {
            if indexPath.row == 0
            {
                let cell = tableView.dequeueReusableCell(withIdentifier: "MyPatientRiskTableCell", for: indexPath) as! MyPatientRiskTableCell
                
                cell.headingTitle?.text = "This Patient's Readmission Risk is"
                
                return cell
            }
            else if indexPath.row == 1
            {
                let cell = tableView.dequeueReusableCell(withIdentifier: "MPRiskIndexTableCell", for: indexPath) as! MPRiskIndexTableCell
                
                cell.headingTitle?.text = "Readmission Risk Index"
                
                return cell
            }
            else
            {
                let cell = tableView.dequeueReusableCell(withIdentifier: "MPRiskFactsTableCell", for: indexPath) as! MPRiskFactsTableCell
                
                cell.headingTitle?.text = "Primary Risk Facts"
                
                return cell
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if tableView == riskTable
        {
            if indexPath.row == 2
            {
                guard let conditionCell = cell as? MPRiskFactsTableCell  else{
                    return
                }
                
                conditionCell.setCollectionViewDataSourceAndDelegate(self, forRow: indexPath.row)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == graphTable {
            
            return 120
        }
        else
        {
            if indexPath.row == 0
            {
                return 88
            }
            else if indexPath.row == 1
            {
                return 190
            }
            else
            {
                return (CGFloat(80+(30*(riskFactsArr.count - 1))))
            }
        }
    }
}
