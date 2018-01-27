//
//  AddPatientVC.swift
//  Readmission Risk
//
//  Created by Somdev Choudhary on 12/12/17.
//  Copyright © 2017 Somdev Choudhary. All rights reserved.
//

import UIKit
import KVNProgress

class AddPatientVC: UIViewController {
    @IBOutlet weak var dashboardTable:TPKeyboardAvoidingTableView!
    
    var conditionsArr:Array<String>! = []
    
    // Profile
    
    var nameStr:String! = ""
    var ageStr:String! = ""
    var heightStr:String! = ""
    var weightStr:String! = ""
    var dobStr:String! = ""
    var arrivalDateStr:String! = ""
    var surgeryDateStr:String! = ""
    var startCutStr:String! = ""
    var stopCutStr:String! = ""
    var genderStr:String! = ""
    
    //Choose
    
    var admissionStr:String = ""
    var aorticStr:String = ""
    var aorticOcclusionStr:String = ""
    var cpaaStr:String = ""
    var cshockStr:String = ""
    var clungStr:String = ""
    var diabetesStr:String = ""
    var dischargeStr:String = ""
    var incidenceStr:String = ""
    var mitralStr:String = ""
    var nodcvStr:String = ""
    var raceStr:String = ""
    var resuscitationStr:String = ""
    var statusStr:String = ""
    var tobaccoStr:String = ""
    
    // Slider
    
 
    var lastCreatineStr:String = ""
    var ejectionFractionStr:String = ""
    var perfusionTimeStr:String = ""
    var crossClampStr:String = ""
    var lastA1Str:String = ""
    var popVTStr:String = ""
    
    // Condition Section Record
    
    var conditionSelArr:Array<String> = []
    
    var profileCell_:AddPatientProfileCell?
    var requestArr:Array<Dictionary<String,Any>>! = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dashboardTable.dataSource = self
        dashboardTable.delegate = self
        
        let conditionTempArr = ["Valve","Dialysis","Diabetes","Reintubated","Hypertension","Liver Disease","Complications","Prior Heart Failure","Immunosuppressive Rx","Intra-Aortic Blood Pump","Prior Miocardial Infarction","Peripheral Vascular Disease","Blood Bank Product Used","Cancer Within 5 Years","Cerebrovascular Disease","IABP","Other Cardiac Procedure","Other Non-Cardiac Procedure","Heart Failure within last 2 Weeks","Intra-Operative Blood Products Used","Pre-Operative Inotropes","Previous Cardiac Intervention"]
        
        conditionsArr = conditionTempArr.sorted(by: <)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        if !AppDelegate.getDelegate().patientDicSelected.isEmpty
        {
            print("get patient",AppDelegate.getDelegate().patientDicSelected)
            
            let selectedDic = AppDelegate.getDelegate().patientDicSelected!
            
            heightStr = "\(selectedDic["Height"] ?? "")"
            nameStr = "\(selectedDic["Name"] ?? "")"
            genderStr = "\(selectedDic["Gender"] ?? "")"
            ageStr = "\(selectedDic["Age"] ?? "")"
            weightStr = "\(selectedDic["Weight"] ?? "")"
            arrivalDateStr = "\(selectedDic["Arrival Date"] ?? "")"
            surgeryDateStr = "\(selectedDic["Surgery Date"] ?? "")"
            startCutStr = "\(selectedDic["Skin Cut Start Time"] ?? "")"
            stopCutStr = "\(selectedDic["Skin Cut Stop Time"] ?? "")"
            
            lastCreatineStr = "\(selectedDic["Last Creatinine Level"] ?? "")"
            ejectionFractionStr = "\(selectedDic["Ejection Fraction"] ?? "")"
            perfusionTimeStr = "\(selectedDic["Perfusion Time"] ?? "")"
            crossClampStr = "\(selectedDic["Cross Clamp Time"] ?? "")"
            lastA1Str = "\(selectedDic["Last A1C Level"] ?? "")"
            popVTStr = "\(selectedDic["Post-Operative Ventilation Time"] ?? "")"
            
            
            /*admissionStr = "\(selectedDic["Last Creatinine Level"] ?? "")"
            aorticStr = "\(selectedDic["Ejection Fraction"] ?? "")"
            aorticOcclusionStr = "\(selectedDic["Perfusion Time"] ?? "")"
            cpaaStr = "\(selectedDic["Cross Clamp Time"] ?? "")"
            cshockStr = "\(selectedDic["Last A1C Level"] ?? "")"
            clungStr = "\(selectedDic["Post-Operative Ventilation Time"] ?? "")"
            diabetesStr = "\(selectedDic["Perfusion Time"] ?? "")"
            dischargeStr = "\(selectedDic["Cross Clamp Time"] ?? "")"
            incidenceStr = "\(selectedDic["Last A1C Level"] ?? "")"
            mitralStr = "\(selectedDic["Post-Operative Ventilation Time"] ?? "")"
            nodcvStr = "\(selectedDic["Cross Clamp Time"] ?? "")"
            raceStr = "\(selectedDic["Last A1C Level"] ?? "")"
            resuscitationStr = "\(selectedDic["Post-Operative Ventilation Time"] ?? "")"
            statusStr = "\(selectedDic["Last A1C Level"] ?? "")"
            tobaccoStr = "\(selectedDic["Post-Operative Ventilation Time"] ?? "")"*/
          
           if let tempArr = selectedDic["Primary Risk Factors"] as? Array<String>
           {
              conditionSelArr = tempArr
           }
        
            dashboardTable.reloadData()

        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
        if !AppDelegate.getDelegate().patientDicSelected.isEmpty
        {
           AppDelegate.getDelegate().patientDicSelected .removeAll()
        }
        
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
    
    // MARK:- TextField Delegates
    
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
            else if textField == cell.gender_TF{
                
                addAlertController(self, title: "Gender", textFieldName: "Gender", alertHandlerOk: { (message) in
                    self.genderStr = message
                    
                    if let cell = self.dashboardTable.cellForRow(at: IndexPath(row:0,section:0)) as? AddPatientProfileCell
                    {
                        cell.gender_TF?.text = message
                    }
                    
                })
          
                return false
            }
            
        }
        
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        if let conditionCell = dashboardTable.cellForRow(at: IndexPath(row:0,section:0))
        {
            guard let cell = conditionCell as? AddPatientProfileCell  else{
                return true
            }

            if textField == cell.age_TF || textField == cell.height_TF || textField == cell.weight_TF
            {
                
                let allowedCharacters = CharacterSet.decimalDigits
                let characterSet = CharacterSet(charactersIn: string)
                
                return allowedCharacters.isSuperset(of: characterSet)
            }
        }

       return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let conditionCell = dashboardTable.cellForRow(at: IndexPath(row:0,section:0))
        {
            guard let cell = conditionCell as? AddPatientProfileCell  else{
                return
            }
            
            if textField == cell.name_TF
            {
                nameStr = textField.text
                cell.name_TF?.text = nameStr
            }
            else if textField == cell.age_TF
            {
                ageStr = textField.text
                cell.age_TF?.text = ageStr
            }
            else if textField == cell.weight_TF
            {
                weightStr = textField.text
                cell.weight_TF?.text = weightStr
            }
            else if textField == cell.height_TF
            {
                heightStr = textField.text
                cell.height_TF?.text = heightStr
            }
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func updateProfileTextField() {
        
        if let profileCell = self.dashboardTable.cellForRow(at: IndexPath(row:0,section:0))
        {
            guard let cell = profileCell as? AddPatientProfileCell  else{
                return
            }
            
            cell.dob_TF?.text = self.dobStr
            cell.skinCutStartTime_TF?.text = self.startCutStr
            cell.skinCutStopTime_TF?.text = self.stopCutStr
            cell.arrivalDate_TF?.text = self.arrivalDateStr
            cell.surgeryDate_TF?.text = self.surgeryDateStr
        }
        
    }
    
    func datePickerTapped(_ dateTypeStr:String) {
        let currentDate = Date()
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
                                    formatter.dateFormat = "dd-MMM-yyyy"
                                    let selectedDateStr = formatter.string(from: dt)
                                    
                                    self.dobStr = selectedDateStr
                                    
                                    self.updateProfileTextField()
                                    
                                }
            }
        }
        else if dateTypeStr == "Skin Cut Start Time" || dateTypeStr == "Skin Cut Stop Time"
        {
            datePicker.show(dateTypeStr, doneButtonTitle: "Done", cancelButtonTitle: "Cancel",  minimumDate: nil, maximumDate: nil, datePickerMode: .time, callback: { (timeStr) in
                if let time_ = timeStr {
                    let formatter = DateFormatter()
                    formatter.dateFormat = "hh:mm a"
                    
                    let selectedTimeStr = formatter.string(from: time_)
                    
                    if dateTypeStr == "Skin Cut Start Time"
                    {
                        self.startCutStr = selectedTimeStr
                        
                    }
                    else if dateTypeStr == "Skin Cut Stop Time"
                    {
                        self.stopCutStr = selectedTimeStr
                    }
                    
                    self.updateProfileTextField()
                }
            })
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
                                    formatter.dateFormat = "dd-MMM-yyyy"
                                    let selectedDateStr = formatter.string(from: dt)
                                    
                                    if dateTypeStr == "Arrival Date"
                                    {
                                        self.arrivalDateStr = selectedDateStr
                                    }
                                    else if dateTypeStr == "Surgery Date"
                                    {
                                        self.surgeryDateStr = selectedDateStr
                                    }
                                    
                                    self.updateProfileTextField()
                                    //self.dashboardTable .reloadData()
                                }
            }
        }
        
    }
    
    // MARK:- Slider Values
    
   @objc func creatinineSlider(_ sender:UISlider) {
        
        if sender.tag == 201
        {
            
            if let sliderCell = self.dashboardTable.cellForRow(at: IndexPath(row:1,section:0))
            {
                guard let cell = sliderCell as? AddPatientSliderCell  else{
                    return
                }
                cell.creatininePer_Lbl?.text = String(describing:Int(sender.value))
                lastCreatineStr = (cell.creatininePer_Lbl?.text)!
            }
            
        }
       else if sender.tag == 202
        {
            if let sliderCell = self.dashboardTable.cellForRow(at: IndexPath(row:1,section:0))
            {
                guard let cell = sliderCell as? AddPatientSliderCell  else{
                    return
                }
                cell.ejectionPer_Lbl?.text = String(describing:Int(sender.value))
                ejectionFractionStr = (cell.ejectionPer_Lbl?.text)!
            }
        }
        else if sender.tag == 203
        {
            if let sliderCell = self.dashboardTable.cellForRow(at: IndexPath(row:1,section:0))
            {
                guard let cell = sliderCell as? AddPatientSliderCell  else{
                    return
                }
                cell.perfusionPer_Lbl?.text = String(describing:Int(sender.value))
                perfusionTimeStr = (cell.perfusionPer_Lbl?.text)!
            }
        }
        else if sender.tag == 204
        {
            if let sliderCell = self.dashboardTable.cellForRow(at: IndexPath(row:1,section:0))
            {
                guard let cell = sliderCell as? AddPatientSliderCell  else{
                    return
                }
                cell.crossPer_Lbl?.text = String(describing:Int(sender.value))
                crossClampStr = (cell.crossPer_Lbl?.text)!
            }
        }
        else if sender.tag == 205
        {
            if let sliderCell = self.dashboardTable.cellForRow(at: IndexPath(row:1,section:0))
            {
                guard let cell = sliderCell as? AddPatientSliderCell  else{
                    return
                }
                cell.lastPer_Lbl?.text = String(describing:Int(sender.value))
                lastA1Str = (cell.lastPer_Lbl?.text)!
            }
        }
        else
        {
            if let sliderCell = self.dashboardTable.cellForRow(at: IndexPath(row:1,section:0))
            {
                guard let cell = sliderCell as? AddPatientSliderCell  else{
                    return
                }
                cell.postPer_Lbl?.text = String(describing:Int(sender.value))
                popVTStr = (cell.postPer_Lbl?.text)!
            }
        }
        
    }
    
    // MARK:- Cell Action Performed
    
    @IBAction func admissionSource_btnTapped(_ sender:UIButton)
    {
        addAlertController(self, title: "Admission Source", textFieldName: "AdmissionSource", alertHandlerOk: { (message) in
            
            self.admissionStr = message
         
            if let chooseCell = self.dashboardTable.cellForRow(at: IndexPath(row:2,section:0))
            {
                guard let cell = chooseCell as? AddPatientChooseCell  else{
                    return
                }
                cell.as_TF?.text = message
            }
        
        })
    }
    
    @IBAction func aortic_btnTapped(_ sender:UIButton)
    {
        
        addAlertController(self, title: "Aortic Insufficiency", textFieldName: "AorticInsufficiency", alertHandlerOk: { (message) in
            
            self.aorticStr = message
            if let chooseCell = self.dashboardTable.cellForRow(at: IndexPath(row:2,section:0))
            {
                guard let cell = chooseCell as? AddPatientChooseCell  else{
                    return
                }
                cell.ai_TF?.text = message
            }
            
        })
    }
    @IBAction func aorticOcclusion_btnTapped(_ sender:UIButton)
    {
        
        addAlertController(self, title: "Aortic Occlusion", textFieldName: "AorticOcclusion", alertHandlerOk: { (message) in
            self.aorticOcclusionStr = message
            
            if let chooseCell = self.dashboardTable.cellForRow(at: IndexPath(row:2,section:0))
            {
                guard let cell = chooseCell as? AddPatientChooseCell  else{
                    return
                }
                cell.ao_TF?.text = message
            }
            
        })
    }
    @IBAction func cpaa_btnTapped(_ sender:UIButton)
    {
        
        addAlertController(self, title: "Cardiac Presentation at Admission", textFieldName: "CardiacPresentationatAdmission", alertHandlerOk: { (message) in
            self.cpaaStr = message
            
            if let chooseCell = self.dashboardTable.cellForRow(at: IndexPath(row:2,section:0))
            {
                guard let cell = chooseCell as? AddPatientChooseCell  else{
                    return
                }
                cell.cpaa_TF?.text = message
            }
            
        })
    }
    @IBAction func cshock_btnTapped(_ sender:UIButton)
    {
        
        addAlertController(self, title: "Cardiogenic Shock", textFieldName: "CardiogenicShock", alertHandlerOk: { (message) in
            self.cshockStr = message
            
            if let chooseCell = self.dashboardTable.cellForRow(at: IndexPath(row:2,section:0))
            {
                guard let cell = chooseCell as? AddPatientChooseCell  else{
                    return
                }
                cell.cshock_TF?.text = message
            }
            
        })
    }
    @IBAction func clungDisease_btnTapped(_ sender:UIButton)
    {
        
        addAlertController(self, title: "Chronic Lung Disease", textFieldName: "ChronicLungDisease", alertHandlerOk: { (message) in
            self.clungStr = message
            
            if let chooseCell = self.dashboardTable.cellForRow(at: IndexPath(row:2,section:0))
            {
                guard let cell = chooseCell as? AddPatientChooseCell  else{
                    return
                }
                cell.clungDisease_TF?.text = message
            }
            
        })
    }
    @IBAction func diabetesControl_btnTapped(_ sender:UIButton)
    {
        
        addAlertController(self, title: "Diabetes Control", textFieldName: "DiabetesControl", alertHandlerOk: { (message) in
            self.diabetesStr = message
            
            if let chooseCell = self.dashboardTable.cellForRow(at: IndexPath(row:2,section:0))
            {
                guard let cell = chooseCell as? AddPatientChooseCell  else{
                    return
                }
                cell.diabetesControl_TF?.text = message
            }
            
        })
    }
    @IBAction func dischargeLoc_btnTapped(_ sender:UIButton)
    {
        
        addAlertController(self, title: "Discharge Location", textFieldName: "DischargeLocation", alertHandlerOk: { (message) in
            self.dischargeStr = message
            
            if let chooseCell = self.dashboardTable.cellForRow(at: IndexPath(row:2,section:0))
            {
                guard let cell = chooseCell as? AddPatientChooseCell  else{
                    return
                }
                cell.dischargeLoc_TF?.text = message
            }
            
        })
    }
    @IBAction func incidence_btnTapped(_ sender:UIButton)
    {
        
        addAlertController(self, title: "Incidence", textFieldName: "Incidence", alertHandlerOk: { (message) in
            self.incidenceStr = message
            
            if let chooseCell = self.dashboardTable.cellForRow(at: IndexPath(row:2,section:0))
            {
                guard let cell = chooseCell as? AddPatientChooseCell  else{
                    return
                }
                cell.incidence_TF?.text = message
            }
            
        })
    }
    @IBAction func mitralInsufficiency_btnTapped(_ sender:UIButton)
    {
        
        addAlertController(self, title: "Mitral Insufficiency", textFieldName: "MitralInsufficiency", alertHandlerOk: { (message) in
            self.mitralStr = message
            
            if let chooseCell = self.dashboardTable.cellForRow(at: IndexPath(row:2,section:0))
            {
                guard let cell = chooseCell as? AddPatientChooseCell  else{
                    return
                }
                cell.mitral_TF?.text = message
            }
            
        })
    }
    
    @IBAction func nodcv_btnTapped(_ sender:UIButton)
    {
        
        addAlertController(self, title: "Number of Diseased Coronary Vessels", textFieldName: "NumberofDiseasedCoronaryVessels", alertHandlerOk: { (message) in
            self.nodcvStr = message
            
            if let chooseCell = self.dashboardTable.cellForRow(at: IndexPath(row:2,section:0))
            {
                guard let cell = chooseCell as? AddPatientChooseCell  else{
                    return
                }
                cell.nodcv_TF?.text = message
            }
            
        })
    }
    @IBAction func race_btnTapped(_ sender:UIButton)
    {
        
        addAlertController(self, title: "Race", textFieldName: "Race", alertHandlerOk: { (message) in
            self.raceStr = message
            
            if let chooseCell = self.dashboardTable.cellForRow(at: IndexPath(row:2,section:0))
            {
                guard let cell = chooseCell as? AddPatientChooseCell  else{
                    return
                }
                cell.race_TF?.text = message
            }
            
        })
    }
    @IBAction func resuscitation_btnTapped(_ sender:UIButton)
    {
        
        addAlertController(self, title: "Resuscitation", textFieldName: "Resuscitation", alertHandlerOk: { (message) in
            self.resuscitationStr = message
            
            if let chooseCell = self.dashboardTable.cellForRow(at: IndexPath(row:2,section:0))
            {
                guard let cell = chooseCell as? AddPatientChooseCell  else{
                    return
                }
                cell.resuscitation_TF?.text = message
            }
            
        })
    }
    @IBAction func status_btnTapped(_ sender:UIButton)
    {
        
        addAlertController(self, title: "Status", textFieldName: "Status", alertHandlerOk: { (message) in
            self.statusStr = message
            
            if let chooseCell = self.dashboardTable.cellForRow(at: IndexPath(row:2,section:0))
            {
                guard let cell = chooseCell as? AddPatientChooseCell  else{
                    return
                }
                cell.status_TF?.text = message
            }
            
        })
    }
    @IBAction func tobaccoUse_btnTapped(_ sender:UIButton)
    {
        
        addAlertController(self, title: "Tobacco Use", textFieldName: "TobaccoUse", alertHandlerOk: { (message) in
            self.tobaccoStr = message
            
            if let chooseCell = self.dashboardTable.cellForRow(at: IndexPath(row:2,section:0))
            {
                guard let cell = chooseCell as? AddPatientChooseCell  else{
                    return
                }
                cell.tobaccoUse_TF?.text = message
            }
            
        })
    }
    
    // MARK:- API Work
    
    @IBAction func submit_btnTapped(_ sender:Any)
    {
        
        validateAddPatient(nameStr, ageStr: ageStr, dobStr: dobStr, genderStr: genderStr, heightStr: heightStr, weightStr: weightStr, arrivalDate: arrivalDateStr, surgeryDate: surgeryDateStr, skinCutStart: startCutStr, skinCutStop: stopCutStr, lastCreatine: lastCreatineStr, ejection: ejectionFractionStr, perfusion: perfusionTimeStr, crossClamp: crossClampStr, lastA1: lastA1Str, postOperative: popVTStr, admission: admissionStr, aorticInsufficiency: aorticStr, aorticOcclusion: aorticOcclusionStr, cardiac: cpaaStr, cshock: cshockStr, clung: clungStr, diabets: diabetesStr, discharge: dischargeStr, incidence: incidenceStr, mitral: mitralStr, nodcv: nodcvStr, race: raceStr, resuscitation: resuscitationStr, status: statusStr, tobbaco: tobaccoStr) { (flagStatus) in
            
            if flagStatus
            {
                print("API")
                
                let checkInternet = AppDelegate.getDelegate() .networkStatus()
                
                if checkInternet == true {
                    
                    KVNProgress.show()
                    
                    // =========== Skin cut start and stop time are static right now =========
                    
                    if let pcell = self.profileCell_
                    {
                        if let name = pcell.name_TF?.text
                        {
                            self.nameStr = name
                        }
                        if let age = pcell.age_TF?.text
                        {
                            self.ageStr = age
                        }
                        if let height = pcell.height_TF?.text
                        {
                            self.heightStr = height
                        }
                        if let weight = pcell.weight_TF?.text
                        {
                            self.weightStr = weight
                        }
                    }
                    
                    
                    let paramsDict = ["patients":[["Height":self.heightStr!,"Conditions":self.conditionsArr!,"Cross Clamp Time":self.crossClampStr,"Weight":self.weightStr!,"Race":self.raceStr,"Ejection Fraction":self.ejectionFractionStr,"Status":self.statusStr,"Chronic Lung Disease":self.clungStr,"Name":self.nameStr!,"Surgery Date":self.surgeryDateStr!,"Post-Operative Ventilation Time":self.popVTStr,"Incidence":self.incidenceStr,"Discharge Location":self.dischargeStr,"Aortic Insufficiency":self.aorticStr,"Last Creatinine Level":self.lastCreatineStr,"Tobacco Use":self.tobaccoStr,"Perfusion Time":self.perfusionTimeStr,"Last A1C Level":self.lastA1Str,"Age":self.ageStr!,"Gender":self.genderStr,"Skin Cut Start Time":self.startCutStr,"Admission Source":self.admissionStr,"Cardiac Presentation at Admission":self.cpaaStr,"Arrival Date":self.arrivalDateStr,"Cardiogenic Shock":self.cshockStr,"Skin Cut Stop Time":self.stopCutStr,"Resuscitation":self.resuscitationStr,"Number of Diseased Coronary Vessels":self.nodcvStr,"Diabetes Control":self.diabetesStr,"Aortic Occlusion":self.aorticOcclusionStr,"Mitral Insufficiency":self.mitralStr]]] as [String:Any]
                    
                    print("paramdic",paramsDict)
                    
                    let caller = ServiceCallerSwift.init()
                    
                    caller.makePostAPI(paramsDict, requestName: "AddPatient", urlString: kAddPatient, postString: "", success: { (dict, requestName) in
                        KVNProgress.dismiss()
                        print("dictttt",dict)
                        
                        if let statusSubmitted = dict["submission status"] as? String
                        {
                            DispatchQueue.main.async {
                                
                                 self.showNormalAlertWithTitle(kAlertTitle, message: statusSubmitted)
                            }
                        }
                        
                        
                    }) { (error, reequestName) in
                        
                        KVNProgress.dismiss()
                        print(error.localizedDescription)
                        
                        DispatchQueue.main.async {
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
            else
            {
                print("False")
            }
          }
            
        }
    
    // MARK:- Reload View
    
//    func reloadRefineViewFromNib() {
//        let parent = view.superview
//        view.removeFromSuperview()
//        view = nil
//        parent?.addSubview(view) // This line causes the view to be reloaded
//    }
  
}

extension AddPatientVC:UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddPatientProfileCell", for: indexPath) as! AddPatientProfileCell
            
            profileCell_ = cell
            
            cell.name_TF?.delegate = self
            cell.gender_TF?.delegate = self
            cell.dob_TF?.delegate = self
            cell.age_TF?.delegate = self
            cell.height_TF?.delegate = self
            cell.weight_TF?.delegate = self
            cell.arrivalDate_TF?.delegate = self
            cell.surgeryDate_TF?.delegate = self
            cell.skinCutStartTime_TF?.delegate = self
            cell.skinCutStopTime_TF?.delegate = self
            
            cell.dob_TF?.text = dobStr
            cell.arrivalDate_TF?.text = arrivalDateStr
            cell.surgeryDate_TF?.text = surgeryDateStr
            cell.skinCutStartTime_TF?.text = startCutStr
            cell.skinCutStopTime_TF?.text = stopCutStr
            cell.gender_TF?.text = genderStr
            cell.name_TF?.text = nameStr
            cell.height_TF?.text = heightStr
            cell.weight_TF?.text = weightStr
            cell.age_TF?.text = ageStr
            
            return cell
        }
        else if indexPath.row == 1
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddPatientSliderCell", for: indexPath) as! AddPatientSliderCell
            
            
            cell.creatinine_Slider.addTarget(self, action: #selector(creatinineSlider(_:)), for: .valueChanged)
            cell.ejection_Slider.addTarget(self, action: #selector(creatinineSlider(_:)), for: .valueChanged)
            cell.perfusion_Slider.addTarget(self, action: #selector(creatinineSlider(_:)), for: .valueChanged)
            cell.cross_Slider.addTarget(self, action: #selector(creatinineSlider(_:)), for: .valueChanged)
            cell.last_Slider.addTarget(self, action: #selector(creatinineSlider(_:)), for: .valueChanged)
            cell.post_Slider.addTarget(self, action: #selector(creatinineSlider(_:)), for: .valueChanged)
            
            
            if lastCreatineStr != ""
            {
               cell.creatininePer_Lbl?.text = lastCreatineStr
               cell.creatinine_Slider.value = Float(lastCreatineStr)!
            }
            if ejectionFractionStr != ""
            {
               cell.ejectionPer_Lbl?.text = ejectionFractionStr
               cell.ejection_Slider.value = Float(ejectionFractionStr)!
            }
            if perfusionTimeStr != ""
            {
                cell.perfusionPer_Lbl?.text = perfusionTimeStr
                cell.perfusion_Slider.value = Float(perfusionTimeStr)!
            }
            if crossClampStr != ""
            {
                cell.crossPer_Lbl?.text = crossClampStr
                cell.cross_Slider.value = Float(crossClampStr)!
            }
            if lastA1Str != ""
            {
                cell.lastPer_Lbl?.text = lastA1Str
                cell.last_Slider.value = Float(lastA1Str)!
            }
            if popVTStr != ""
            {
                cell.postPer_Lbl?.text = popVTStr
                cell.post_Slider.value = Float(popVTStr)!
            }
            
            return cell
            
        }
        else if indexPath.row == 2
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddPatientChooseCell", for: indexPath) as! AddPatientChooseCell
            
        
            cell.as_TF.text = admissionStr
            cell.ai_TF.text = aorticStr
            cell.ao_TF.text = aorticOcclusionStr
            cell.cpaa_TF.text = cpaaStr
            cell.cshock_TF.text = cshockStr
            cell.clungDisease_TF.text = clungStr
            cell.diabetesControl_TF.text = diabetesStr
            cell.dischargeLoc_TF.text = dischargeStr
            cell.incidence_TF.text = incidenceStr
            cell.mitral_TF.text = mitralStr
            cell.nodcv_TF.text = nodcvStr
            cell.race_TF.text = raceStr
            cell.resuscitation_TF.text = resuscitationStr
            cell.status_TF.text = statusStr
            cell.tobaccoUse_TF.text = tobaccoStr
        
            
            return cell
            
        }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddPatientConditionCell", for: indexPath) as! AddPatientConditionCell
            
            
            
            return cell
        }
        
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if indexPath.row == 3
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
        else if indexPath.row == 2
        {
            return 685
        }
        else
        {
            return CGFloat(100 + (43 * conditionsArr.count/2))
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
        
        //cell.conditionCheckBox.tag = indexPath.row
        
        if conditionSelArr.contains(conditionsArr[indexPath.row]) {
            
            cell.conditionCheckBox.isSelected = true
        }
        else
        {
            cell.conditionCheckBox.isSelected = false
        }
        
        cell.conditionTitle.text = conditionsArr[indexPath.item]
        return cell
    }
    
func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
    
    if conditionSelArr.contains(conditionsArr[indexPath.row])
    {
        let indexToRemove = conditionSelArr.index(of: conditionsArr[indexPath.row])
        conditionSelArr.remove(at: indexToRemove!)
        
        if let conditionColl = collectionView.cellForItem(at: IndexPath(row:indexPath.row,section:0))
        {
            guard let cell = conditionColl as? AddPatientConditionCC else{
                return
            }
            cell.conditionCheckBox.isSelected = false
        }
    }
    else
    {
       conditionSelArr.append(conditionsArr[indexPath.row])
        
        if let conditionColl = collectionView.cellForItem(at: IndexPath(row:indexPath.row,section:0))
        {
            guard let cell = conditionColl as? AddPatientConditionCC else{
                return
            }
            cell.conditionCheckBox.isSelected = true
        }
      }
    
    }
 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:collectionView.frame.size.width/2-2,height:40)
    }
    
}

