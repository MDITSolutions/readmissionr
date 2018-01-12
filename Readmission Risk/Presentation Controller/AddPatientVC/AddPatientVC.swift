//
//  AddPatientVC.swift
//  Readmission Risk
//
//  Created by Somdev Choudhary on 12/12/17.
//  Copyright © 2017 Somdev Choudhary. All rights reserved.
//

import UIKit

class AddPatientVC: UIViewController {
    @IBOutlet weak var dashboardTable:TPKeyboardAvoidingTableView!
    var conditionsArr:Array<String>! = []
    
    var dobStr:String = ""
    var arrivalDateStr:String = ""
    var surgeryDateStr:String = ""
    var startCutStr:String = ""
    var stopCutStr:String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dashboardTable.dataSource = self
        dashboardTable.delegate = self
        
        conditionsArr = ["Valve","Dialysis","Diabetes","Reintubated","Hypertension","Liver Disease","Complications","Prior Heart Failure","Immunosupressive Rx","Intra-Aortic Blood Pump","Pre-Operative Inotropes","Cerebrovascular Disease","Prior Miocardia Infarction","Peripheral Vascular Disease","Blood Bank Product Used","Previous Cardiac Intervention","Other Cardiac Procedure","Other Non-Cardiac Procedure","Heart Failure within last 2 Weeks","Intra-Operative Blood Products Used"]

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
    
   /* @IBAction func showDatePicker(_ sender: UIButton) {
        let datePicker = UIDatePicker()//Date picker
        datePicker.frame = CGRect(x: 0, y: 0, width: 320, height: 216)
        datePicker.datePickerMode = .dateAndTime
        datePicker.minuteInterval = 5
        datePicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
        
        let popoverView = UIView()
        popoverView.backgroundColor = UIColor.clear
        popoverView.addSubview(datePicker)
        // here you can add tool bar with done and cancel buttons if required
        
        let popoverViewController = UIViewController()
        popoverViewController.view = popoverView
        popoverViewController.view.frame = CGRect(x: 0, y: 0, width: 320, height: 216)
        popoverViewController.modalPresentationStyle = .popover
        popoverViewController.preferredContentSize = CGSize(width: 320, height: 216)
        popoverViewController.popoverPresentationController?.sourceView = sender // source button
        popoverViewController.popoverPresentationController?.sourceRect = sender.bounds // source button bounds
        self.present(popoverViewController, animated: true, completion: nil)
        
    }
    @objc func dateChanged(_ datePicker: UIDatePicker) {
        print("DATE :: \(datePicker.date)")
    }*/
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        if let conditionCell = dashboardTable.cellForRow(at: IndexPath(row:0,section:0))
        {
            guard let cell = conditionCell as? AddPatientProfileCell  else{
                return true
            }
            
            if textField == cell.dob_TF {
                datePickerTapped("Date of Birth")
                return false
            }
            else if textField == cell.arrivalDate_TF {
                datePickerTapped("Arrival Date")
                return false
            }
            else if textField == cell.surgeryDate_TF {
                datePickerTapped("Surgery Date")
                return false
            }
            else if textField == cell.skinCutStartTime_TF {
                datePickerTapped("Skin Cut Start Time")
                return false
            }
            else if textField == cell.skinCutStopTime_TF {
                datePickerTapped("Skin Cut Stop Time")
                return false
            }
            
        }
        
        return true
    }
    
    func datePickerTapped(_ dateTypeStr:String) {
        let currentDate = Date()
       // var dateComponents = DateComponents()
        //dateComponents.month = -3
        //let threeMonthAgo = Calendar.current.date(byAdding: dateComponents, to: currentDate)
        
        let datePicker = DatePickerDialog(textColor: .black,
                                          buttonColor: .black,
                                          font: UIFont.boldSystemFont(ofSize: 17),
                                          showCancelButton: true)
        
        if dateTypeStr == "Date of Birth"
        {
            datePicker.show(dateTypeStr,
                            doneButtonTitle: "Done",
                            cancelButtonTitle: "Cancel",
                            minimumDate: nil,
                            maximumDate: currentDate,
                            datePickerMode: .date) { (date) in
                                if let dt = date {
                                    let formatter = DateFormatter()
                                    formatter.dateFormat = "dd/MM/yyyy"
                                    let selectedDateStr = formatter.string(from: dt)
                                    
                                    print("Selected Date",selectedDateStr)
                                    self.dobStr = selectedDateStr
                                    
                                    self.dashboardTable .reloadData()
                                }
            }
        }
        else
        {
            datePicker.show(dateTypeStr,
                            doneButtonTitle: "Done",
                            cancelButtonTitle: "Cancel",
                            minimumDate: nil,
                            maximumDate: nil,
                            datePickerMode: .date) { (date) in
                                if let dt = date {
                                    let formatter = DateFormatter()
                                    formatter.dateFormat = "dd/MM/yyyy"
                                    let selectedDateStr = formatter.string(from: dt)
                                    
                                    if dateTypeStr == "Arrival Date"
                                    {
                                        self.arrivalDateStr = selectedDateStr
                                    }
                                    else if dateTypeStr == "Surgery Date"
                                    {
                                        self.surgeryDateStr = selectedDateStr
                                    }
                                    else if dateTypeStr == "Skin Cut Start Time"
                                    {
                                        self.startCutStr = selectedDateStr
                                    }
                                    else if dateTypeStr == "Skin Cut Stop Time"
                                    {
                                        self.stopCutStr = selectedDateStr
                                    }
                                    
                                    print("Selected Date",selectedDateStr)
                                    self.dashboardTable .reloadData()
                                }
            }
        }
        
    }

}

extension AddPatientVC:UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddPatientProfileCell", for: indexPath) as! AddPatientProfileCell
            
            cell.dob_TF?.delegate = self
            cell.arrivalDate_TF?.delegate = self
            cell.surgeryDate_TF?.delegate = self
            cell.skinCutStartTime_TF?.delegate = self
            cell.skinCutStopTime_TF?.delegate = self
            
            cell.dob_TF?.text = dobStr
            cell.arrivalDate_TF?.text = arrivalDateStr
            cell.surgeryDate_TF?.text = surgeryDateStr
            cell.skinCutStartTime_TF?.text = startCutStr
            cell.skinCutStopTime_TF?.text = stopCutStr
            
            return cell
        }
        else if indexPath.row == 1
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddPatientSliderCell", for: indexPath) as! AddPatientSliderCell
            return cell
        }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddPatientConditionCell", for: indexPath) as! AddPatientConditionCell
            return cell
        }
        
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if indexPath.row == 2
        {
            guard let conditionCell = cell as? AddPatientConditionCell  else{
                return
            }
            
            conditionCell.setCollectionViewDataSourceAndDelegate(self, forRow: indexPath.row)
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0
        {
            return 445
        }
        else if indexPath.row == 1
        {
            return 332
        }
        else
        {
            return CGFloat(100 + (42 * conditionsArr.count/2))
        }
    }
    
}

extension AddPatientVC:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout
{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return conditionsArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddPatientConditionCC", for: indexPath) as! AddPatientConditionCC
        
        cell.conditionTitle.text = conditionsArr[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:collectionView.frame.size.width/2-2,height:40)
    }
    
}

