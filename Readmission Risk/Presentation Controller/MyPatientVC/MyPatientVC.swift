//
//  MyPatientVC.swift
//  Readmission Risk
//
//  Created by Somdev Choudhary on 12/12/17.
//  Copyright © 2017 Somdev Choudhary. All rights reserved.
//

import UIKit
import KVNProgress

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
    var graphArr:Array<Dictionary<String,Any>>! = []
    var categoricalArr:Array<Dictionary<String,Any>>! = []
    var riskGraphArr:Array<Dictionary<String,Any>>! = []
    var riskFactsArr:Array<String>! = []
    @IBOutlet weak var riskTable:UITableView!
    
    var patientRecordArr:Array<Dictionary<String,Any>>! = []
    var patientNameArr:Array<String>! = []
    var profileDic:Dictionary<String,Any>! = [:]
    
    // Profile Section
    
    @IBOutlet weak var name_Lbl:UILabel!
    @IBOutlet weak var genderAge_Lbl:UILabel!
    @IBOutlet weak var patientNo_Lbl:UILabel!
    @IBOutlet weak var procedure_Lbl:UILabel!
    @IBOutlet weak var doctorName_Lbl:UILabel!
    @IBOutlet weak var surgeryDate_Lbl:UILabel!
    
    //
    var  selectedIndexPath : IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBtn.setButtonBorderColorAndCorner(4.0, btn: searchBtn)
        patientBioView.setBorderColorAndCorner(8.0, cellCustomView: patientBioView)
        graphView.setBorderColorAndCorner(8.0, cellCustomView: graphView)
        riskView.setBorderColorAndCorner(8.0, cellCustomView: riskView)
        
        patientSCV.isHidden = true
        
        hitMyPatientAPI()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("Will appear")
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
    
    // MARK:- Edit Action Performed
    
    @IBAction func edit_btnTapped(_ sender:UIButton)
    {
        if selectedIndexPath == nil
        {
            if !self.patientRecordArr.isEmpty
            {
                let selectedDicResult = self.patientRecordArr[0]
                
                AppDelegate.getDelegate().patientDicSelected = selectedDicResult
            }
        }
        else
        {
            if !self.patientRecordArr.isEmpty
            {
                let selectedDicResult = self.patientRecordArr[(selectedIndexPath?.row)!]
                AppDelegate.getDelegate().patientDicSelected = selectedDicResult
                
                let dashoard = self.storyboard?.instantiateViewController(withIdentifier: "DashboardVC") as! DashboardVC
                
                AppDelegate.getDelegate().window?.rootViewController = dashoard
                AppDelegate.getDelegate().window?.makeKeyAndVisible()
            }
            
            
        }
        
    }
    
    // MARK:- Update Profile Setion
    
    func profileBioSection() {
        
        DispatchQueue.main.async {
            self.name_Lbl.text = self.profileDic["Name"] as? String
            
            let ageStr = self.profileDic["Age"]
            let genderStr = self.profileDic["Gender"] as? String
            let patientNoStr = self.profileDic["Patient Number"]
            let surgeryStr = self.profileDic["Surgery Date"] as! String
            
            self.genderAge_Lbl.text = genderStr! + ", " + "\(String(describing: ageStr!)) years old"
            self.patientNo_Lbl.text = "Patient No: #" + "\(String(describing: patientNoStr!))"
            
            self.surgeryDate_Lbl.text = "Surgery Date : " + surgeryStr
            
            if let riskArr = self.profileDic["Primary Risk Factors"] as? Array<String>
            {
                self.riskFactsArr = riskArr
                
                self.riskTable.reloadData()
            }
            
            if let graphBarArr = self.profileDic["Percentiles"] as? Array<Dictionary<String,Any>>
            {
                self.graphArr = graphBarArr
                self.graphTable.reloadData()
            }
            if let categoricalBarArr = self.profileDic["Categorical"] as? Array<Dictionary<String,Any>>
            {
                self.categoricalArr = categoricalBarArr
                self.graphTable.reloadData()
            }
            
            if let riskBarArr = self.profileDic["Readmission Risk"] as? Array<Dictionary<String,Any>>
            {
               // print("risk graph",riskBarArr)
                DispatchQueue.main.async {
                    
                    UIView.performWithoutAnimation {
                        self.riskTable.reloadRows(at: [IndexPath(row:1,section:0)], with: .none)

                    }
                    
                }
            }
            
        }
        
    }
    
    // MARK:- API Work
    
    func hitMyPatientAPI()
    {
        let checkInternet = AppDelegate.getDelegate() .networkStatus()
        
        if checkInternet == true {
            
            KVNProgress.show()
            
            let urlRequest = kMyPatient + "?doctor=Lee,Daniel"
            
            let caller = ServiceCallerSwift.init()
            
            caller.makeGETAPI("MyPatient", urlString: urlRequest, success: { (dict, requestName) in
                
                DispatchQueue.main.async {
                    KVNProgress.dismiss()
                }
                print(dict)
                
                if dict.count > 0
                {
                    let recordArr = dict["patients"] as? Array<Dictionary<String,Any>>
                    
                    self.patientRecordArr = recordArr
                    
                    if self.patientRecordArr.count > 0
                    {
                        self.profileDic = self.patientRecordArr[0]
                    }
                    
                    self.profileBioSection()
                    
                    if let patientArr_ = dict["patients"] as? Array<Dictionary<String,Any>>
                    {
                        let nameArray = patientArr_.map({ (nameDict) -> String in
                            
                            return nameDict["Name"] as! String
                        })
                        
                        print("nameArray",nameArray)
                        
                        self.selectedIndexPath = IndexPath(row:0,section:0)
                        
                        self.patientNameArr = nameArray
                        
                        DispatchQueue.main.async {
                            self.patientSCV.isHidden = false
                            self.patientCollection.reloadData()
                        }
                        
                    }
                }
                
                
            }) { (error, requestName) in
                
                //KVNProgress.dismiss()
                print(error.localizedDescription)
                
                DispatchQueue.main.async {
                    KVNProgress.dismiss()
                    self.showNormalAlertWithTitle(kAlertTitle, message: "Please try again later")
                }
            }
            
        }
        else
        {
            DispatchQueue.main.async {
                self.showNormalAlertWithTitle(kAlertTitle, message: "Check Internet Connectivity")
            }
        }
        
        
    }

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
            return CGSize(width:140,height:50)
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
            
            profileDic = patientRecordArr[indexPath.row]
            
            UIView.performWithoutAnimation {
                self.profileBioSection()
            }
            patientCollection.reloadData()
            //riskTable.reloadData()
           // graphTable.reloadData()
        }
        
    }
}

extension MyPatientVC:UITableViewDataSource,UITableViewDelegate
{
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView == graphTable
        {
            return 2
        }
        else
        {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == graphTable
        {
            if section == 0
            {
                return graphArr.count
            }
            else
            {
                return categoricalArr.count
            }
            
        }
        else
        {
            return 3
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == graphTable
        {
            if indexPath.section == 0
            {
                let cell = tableView.dequeueReusableCell(withIdentifier: "MyPatientGraphTableCell", for: indexPath) as! MyPatientGraphTableCell
                
                let resultDic = graphArr[indexPath.row]
                
                cell.headingTitle?.text = resultDic["Name"] as? String
                cell.quantity_Lbl?.text = resultDic["Text"] as? String
                cell.updateBarGraphForIndexPath(resultDic, indexpath_: indexPath)
                return cell
            }
            else
            {
                let cell = tableView.dequeueReusableCell(withIdentifier: "MyPatientGraphTableCell", for: indexPath) as! MyPatientGraphTableCell
                
                let resultDic = categoricalArr[indexPath.row]
                
                cell.headingTitle?.text = resultDic["Name"] as? String
                cell.quantity_Lbl?.text = resultDic["Text"] as? String
                cell.updateBarGraphForArrayIndexPath(resultDic, indexpath_: indexPath)
                return cell
            }
            
            
        }
        else
        {
            if indexPath.row == 0
            {
                let cell = tableView.dequeueReusableCell(withIdentifier: "MyPatientRiskTableCell", for: indexPath) as! MyPatientRiskTableCell
                
                cell.headingTitle?.text = "This Patient's Readmission Risk is"
                
                cell.updatePatientRisk(profileDic)
                
                return cell
            }
            else if indexPath.row == 1
            {
                let cell = tableView.dequeueReusableCell(withIdentifier: "MPRiskIndexTableCell", for: indexPath) as! MPRiskIndexTableCell
                
               if let resultArr = profileDic["Readmission Risk"] as? Array<Dictionary<String,Any>>
               {
                    if resultArr.count > 0
                    {
                        let resultDic = resultArr[0]
                        
                        cell.updateRiskIndexBarGraph(resultDic)
                    }
                
                }

                cell.headingTitle?.text = "Readmission Risk Index"
                
                return cell
            }
            else
            {
                let cell = tableView.dequeueReusableCell(withIdentifier: "MPRiskFactsTableCell", for: indexPath) as! MPRiskFactsTableCell
                
                cell.headingTitle?.text = "Primary Risk Factors"
                
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
