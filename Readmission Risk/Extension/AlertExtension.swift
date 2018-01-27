//
//  AlertExtension.swift
//  Readmission Risk
//
//  Created by Somdev Choudhary on 12/01/18.
//  Copyright © 2018 Somdev Choudhary. All rights reserved.
//

import Foundation

extension UIViewController
{
    
    func showNormalAlertWithTitle(_ title:String , message: String) {
        
        let alertWindow = UIWindow.init(frame: UIScreen.main.bounds)
        alertWindow.rootViewController = UIViewController()
        alertWindow.windowLevel = 10000001
        alertWindow.isHidden = false
        
        let alertVC = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction.init(title: "OK", style: .cancel, handler: nil)
        alertVC.addAction(action)
        
        alertWindow.rootViewController?.present(alertVC, animated: true, completion: nil)
    }
    
    func showNormalAlertWithTitleWithHandler(_ title:String , message: String,viewControllerIdentifier:String,alertHandlerOk:@escaping(_ message:String) -> Void) {
        
        let alertWindow = UIWindow.init(frame: UIScreen.main.bounds)
        alertWindow.rootViewController = UIViewController()
        alertWindow.windowLevel = 10000001
        alertWindow.isHidden = false
        
        let alertVC = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        
        alertVC.addAction(UIAlertAction.init(title: "OK", style: .cancel, handler: { (action) in
            
            alertHandlerOk(viewControllerIdentifier)
        }))
        
        alertWindow.rootViewController?.present(alertVC, animated: true, completion: nil)
    }
    
    func addAlertController(_ vc:UIViewController,title:String,textFieldName:String,alertHandlerOk:@escaping(_ message:String) -> Void) {
        
        let alertController = UIAlertController(title: title, message: "", preferredStyle: UIAlertControllerStyle.actionSheet)
        
        if textFieldName == "Gender"
        {
            let maleAction = UIAlertAction.init(title: "Male", style: .default) { (maleSelected) in
                
               alertHandlerOk(maleSelected.title!)
                
            }
            let femaleAction = UIAlertAction.init(title: "Female", style: .default) { (femaleSelected) in
                
                alertHandlerOk(femaleSelected.title!)
            }
            
//            let frameX = self.view.frame.size.width - 300
//            let frameY = 150
            
            alertController.addAction(maleAction)
            alertController.addAction(femaleAction)
            
           //alertController.popoverPresentationController?.sourceRect = CGRect(x:Int(frameX),y:frameY,width:0,height:0)
            
        }
        else if textFieldName == "AdmissionSource"
        {
            let EAAction = UIAlertAction.init(title: "Elective Admission", style: .default) { (EASelected) in
                
                alertHandlerOk(EASelected.title!)
                
            }
            let EDAction = UIAlertAction.init(title: "Emergency Department", style: .default) { (EDSelected) in
                
                alertHandlerOk(EDSelected.title!)
            }
            let TIAction = UIAlertAction.init(title: "Transfer in from another acute care facility", style: .default) { (TISelected) in
                
                alertHandlerOk(TISelected.title!)
                
            }
            let OTAction = UIAlertAction.init(title: "Other", style: .default) { (OTSelected) in
                
                alertHandlerOk(OTSelected.title!)
            }
           
            alertController.addAction(EAAction)
            alertController.addAction(EDAction)
            alertController.addAction(TIAction)
            alertController.addAction(OTAction)
           
        }
        else if textFieldName == "AorticInsufficiency"
        {
            let EAAction = UIAlertAction.init(title: "Trace/trivial", style: .default) { (EASelected) in
                
                alertHandlerOk(EASelected.title!)
                
            }
            let EDAction = UIAlertAction.init(title: "Severe", style: .default) { (EDSelected) in
                
                alertHandlerOk(EDSelected.title!)
            }
            let TIAction = UIAlertAction.init(title: "Moderate", style: .default) { (TISelected) in
                
                alertHandlerOk(TISelected.title!)
                
            }
            let OTAction = UIAlertAction.init(title: "Mild", style: .default) { (OTSelected) in
                
                alertHandlerOk(OTSelected.title!)
            }
            let noneAction = UIAlertAction.init(title: "None", style: .default) { (noSelected) in
                
                alertHandlerOk(noSelected.title!)
            }
            let noReportAction = UIAlertAction.init(title: "Not reported", style: .default) { (NRSelected) in
                
                alertHandlerOk(NRSelected.title!)
            }
            
            alertController.addAction(EAAction)
            alertController.addAction(EDAction)
            alertController.addAction(TIAction)
            alertController.addAction(OTAction)
            alertController.addAction(noneAction)
            alertController.addAction(noReportAction)
            
            
        }
        else if textFieldName == "AorticOcclusion"
        {
            let EAAction = UIAlertAction.init(title: "Aortic Crossclamp", style: .default) { (EASelected) in
                
                alertHandlerOk(EASelected.title!)
                
            }
            let EDAction = UIAlertAction.init(title: "Balloon Occlusion", style: .default) { (EDSelected) in
                
                alertHandlerOk(EDSelected.title!)
            }
            let TIAction = UIAlertAction.init(title: "None - beating heart", style: .default) { (TISelected) in
                
                alertHandlerOk(TISelected.title!)
                
            }
            let OTAction = UIAlertAction.init(title: "None - fibrillating heart", style: .default) { (OTSelected) in
                
                alertHandlerOk(OTSelected.title!)
            }
            
            alertController.addAction(EAAction)
            alertController.addAction(EDAction)
            alertController.addAction(TIAction)
            alertController.addAction(OTAction)
        }
        else if textFieldName == "CardiacPresentationatAdmission"
        {
            let EAAction = UIAlertAction.init(title: "Angina equivalent", style: .default) { (EASelected) in
                
                alertHandlerOk(EASelected.title!)
                
            }
            let EDAction = UIAlertAction.init(title: "Non-ST Elevation MI (Non-STEMI)", style: .default) { (EDSelected) in
                
                alertHandlerOk(EDSelected.title!)
            }
            let TIAction = UIAlertAction.init(title: "ST Elevation MI (STEMI)", style: .default) { (TISelected) in
                
                alertHandlerOk(TISelected.title!)
                
            }
            let OTAction = UIAlertAction.init(title: "Stable Angina", style: .default) { (OTSelected) in
                
                alertHandlerOk(OTSelected.title!)
            }
            let noneAction = UIAlertAction.init(title: "Unstable Angina", style: .default) { (noSelected) in
                
                alertHandlerOk(noSelected.title!)
            }
            let noReportAction = UIAlertAction.init(title: "No Symptoms", style: .default) { (NRSelected) in
                
                alertHandlerOk(NRSelected.title!)
            }
            let otherAction = UIAlertAction.init(title: "Other", style: .default) { (OASelected) in
                
                alertHandlerOk(OASelected.title!)
            }
            
            alertController.addAction(EAAction)
            alertController.addAction(EDAction)
            alertController.addAction(TIAction)
            alertController.addAction(OTAction)
            alertController.addAction(noneAction)
            alertController.addAction(noReportAction)
            alertController.addAction(otherAction)
        }
        else if textFieldName == "CardiogenicShock"
        {
            let EAAction = UIAlertAction.init(title: "Yes - At the time of the procedure", style: .default) { (EASelected) in
                alertHandlerOk(EASelected.title!)
            }
            let EDAction = UIAlertAction.init(title: "Yes, not at the time of the procedure but within prior 24 hours", style: .default) { (EDSelected) in
                
                alertHandlerOk(EDSelected.title!)
            }
            let TIAction = UIAlertAction.init(title: "No", style: .default) { (TISelected) in
                
                alertHandlerOk(TISelected.title!)
            }
            
            alertController.addAction(EAAction)
            alertController.addAction(EDAction)
            alertController.addAction(TIAction)
        }//
        
        else if textFieldName == "ChronicLungDisease"
        {
            let EAAction = UIAlertAction.init(title: "Lung disease documented, severity unknown", style: .default) { (EASelected) in
                alertHandlerOk(EASelected.title!)
            }
            let EDAction = UIAlertAction.init(title: "Mild", style: .default) { (EDSelected) in
                
                alertHandlerOk(EDSelected.title!)
            }
            let TIAction = UIAlertAction.init(title: "Moderate", style: .default) { (TISelected) in
                
                alertHandlerOk(TISelected.title!)
            }
            let OTAction = UIAlertAction.init(title: "No", style: .default) { (OTSelected) in
                
                alertHandlerOk(OTSelected.title!)
            }
            let noneAction = UIAlertAction.init(title: "Severe", style: .default) { (noSelected) in
                
                alertHandlerOk(noSelected.title!)
            }
            let noReportAction = UIAlertAction.init(title: "Unknown", style: .default) { (NRSelected) in
                
                alertHandlerOk(NRSelected.title!)
            }
            
            alertController.addAction(EAAction)
            alertController.addAction(EDAction)
            alertController.addAction(TIAction)
            alertController.addAction(OTAction)
            alertController.addAction(noneAction)
            alertController.addAction(noReportAction)
        }
        else if textFieldName == "DiabetesControl"
        {
            let EAAction = UIAlertAction.init(title: "Diet only", style: .default) { (EASelected) in
                alertHandlerOk(EASelected.title!)
            }
            let EDAction = UIAlertAction.init(title: "Insulin", style: .default) { (EDSelected) in
                
                alertHandlerOk(EDSelected.title!)
            }
            let TIAction = UIAlertAction.init(title: "None", style: .default) { (TISelected) in
                
                alertHandlerOk(TISelected.title!)
            }
            let OTAction = UIAlertAction.init(title: "Oral", style: .default) { (OTSelected) in
                
                alertHandlerOk(OTSelected.title!)
            }
            let noneAction = UIAlertAction.init(title: "Other subcutaneous medication", style: .default) { (noSelected) in
                
                alertHandlerOk(noSelected.title!)
            }
            let noReportAction = UIAlertAction.init(title: "Unknown", style: .default) { (NRSelected) in
                
                alertHandlerOk(NRSelected.title!)
            }
            
            alertController.addAction(EAAction)
            alertController.addAction(EDAction)
            alertController.addAction(TIAction)
            alertController.addAction(OTAction)
            alertController.addAction(noneAction)
            alertController.addAction(noReportAction)
        }
        else if textFieldName == "DischargeLocation"
        {
            let EAAction = UIAlertAction.init(title: "Extended Care/Transitional Care Unit/Rehab", style: .default) { (EASelected) in
                alertHandlerOk(EASelected.title!)
            }
            let EDAction = UIAlertAction.init(title: "Home", style: .default) { (EDSelected) in
                
                alertHandlerOk(EDSelected.title!)
            }
            let TIAction = UIAlertAction.init(title: "Hospice", style: .default) { (TISelected) in
                
                alertHandlerOk(TISelected.title!)
            }
            let OTAction = UIAlertAction.init(title: "Nursing Home", style: .default) { (OTSelected) in
                
                alertHandlerOk(OTSelected.title!)
            }
            let noneAction = UIAlertAction.init(title: "Other", style: .default) { (noSelected) in
                
                alertHandlerOk(noSelected.title!)
            }
            let noReportAction = UIAlertAction.init(title: "Other acute care hospital", style: .default) { (NRSelected) in
                
                alertHandlerOk(NRSelected.title!)
            }
            
            alertController.addAction(EAAction)
            alertController.addAction(EDAction)
            alertController.addAction(TIAction)
            alertController.addAction(OTAction)
            alertController.addAction(noneAction)
            alertController.addAction(noReportAction)
        }
        
        else if textFieldName == "Incidence"
        {
            let EAAction = UIAlertAction.init(title: "First cardiovascular surgery", style: .default) { (EASelected) in
                alertHandlerOk(EASelected.title!)
            }
            let EDAction = UIAlertAction.init(title: "First re-op cardiovascular surgery", style: .default) { (EDSelected) in
                
                alertHandlerOk(EDSelected.title!)
            }
            let TIAction = UIAlertAction.init(title: "Second re-op cardiovascular surgery", style: .default) { (TISelected) in
                
                alertHandlerOk(TISelected.title!)
            }
            
            alertController.addAction(EAAction)
            alertController.addAction(EDAction)
            alertController.addAction(TIAction)
           
        }
        else if textFieldName == "MitralInsufficiency"
        {
            let EAAction = UIAlertAction.init(title: "Mild", style: .default) { (EASelected) in
                alertHandlerOk(EASelected.title!)
            }
            let EDAction = UIAlertAction.init(title: "Moderate", style: .default) { (EDSelected) in
                
                alertHandlerOk(EDSelected.title!)
            }
            let TIAction = UIAlertAction.init(title: "None", style: .default) { (TISelected) in
                
                alertHandlerOk(TISelected.title!)
            }
            let OTAction = UIAlertAction.init(title: "Not reported", style: .default) { (OTSelected) in
                
                alertHandlerOk(OTSelected.title!)
            }
            let noneAction = UIAlertAction.init(title: "Severe", style: .default) { (noSelected) in
                
                alertHandlerOk(noSelected.title!)
            }
            let noReportAction = UIAlertAction.init(title: "Trace/trivial", style: .default) { (NRSelected) in
                
                alertHandlerOk(NRSelected.title!)
            }
            
            alertController.addAction(EAAction)
            alertController.addAction(EDAction)
            alertController.addAction(TIAction)
            alertController.addAction(OTAction)
            alertController.addAction(noneAction)
            alertController.addAction(noReportAction)
        }
        else if textFieldName == "NumberofDiseasedCoronaryVessels"
        {
            let EAAction = UIAlertAction.init(title: "0", style: .default) { (EASelected) in
                alertHandlerOk(EASelected.title!)
            }
            let EDAction = UIAlertAction.init(title: "1", style: .default) { (EDSelected) in
                
                alertHandlerOk(EDSelected.title!)
            }
            let TIAction = UIAlertAction.init(title: "2", style: .default) { (TISelected) in
                
                alertHandlerOk(TISelected.title!)
            }
            let OTAction = UIAlertAction.init(title: "3", style: .default) { (OTSelected) in
                
                alertHandlerOk(OTSelected.title!)
            }
            
            alertController.addAction(EAAction)
            alertController.addAction(EDAction)
            alertController.addAction(TIAction)
            alertController.addAction(OTAction)
           
        }
        
        else if textFieldName == "Race"
        {
            let EAAction = UIAlertAction.init(title: "Hispanic", style: .default) { (EASelected) in
                alertHandlerOk(EASelected.title!)
            }
            let EDAction = UIAlertAction.init(title: "African American", style: .default) { (EDSelected) in
                
                alertHandlerOk(EDSelected.title!)
            }
            let TIAction = UIAlertAction.init(title: "Asian", style: .default) { (TISelected) in
                
                alertHandlerOk(TISelected.title!)
            }
            let OTAction = UIAlertAction.init(title: "Caucasian", style: .default) { (OTSelected) in
                
                alertHandlerOk(OTSelected.title!)
            }
            let noneAction = UIAlertAction.init(title: "Native American", style: .default) { (noSelected) in
                
                alertHandlerOk(noSelected.title!)
            }
            let noReportAction = UIAlertAction.init(title: "Pacific Islander", style: .default) { (NRSelected) in
                
                alertHandlerOk(NRSelected.title!)
            }
            let otherAction = UIAlertAction.init(title: "Other", style: .default) { (noSelected) in
                
                alertHandlerOk(noSelected.title!)
            }
            let noDocAction = UIAlertAction.init(title: "Not Documented", style: .default) { (NRSelected) in
                
                alertHandlerOk(NRSelected.title!)
            }
            
            alertController.addAction(EAAction)
            alertController.addAction(EDAction)
            alertController.addAction(TIAction)
            alertController.addAction(OTAction)
            alertController.addAction(noneAction)
            alertController.addAction(noReportAction)
            alertController.addAction(otherAction)
            alertController.addAction(noDocAction)
        }
        
        else if textFieldName == "Resuscitation"
        {
            let EAAction = UIAlertAction.init(title: "Yes - More than 1 hour but less than 24 hours of the start of the procedure", style: .default) { (EASelected) in
                alertHandlerOk(EASelected.title!)
            }
            let EDAction = UIAlertAction.init(title: "Yes - Within 1 hour of the start of the procedure", style: .default) { (EDSelected) in
                
                alertHandlerOk(EDSelected.title!)
            }
            let TIAction = UIAlertAction.init(title: "No", style: .default) { (TISelected) in
                
                alertHandlerOk(TISelected.title!)
            }
            
            alertController.addAction(EAAction)
            alertController.addAction(EDAction)
            alertController.addAction(TIAction)
            
        }
        
        else if textFieldName == "Status"
        {
            let EAAction = UIAlertAction.init(title: "Emergent", style: .default) { (EASelected) in
                alertHandlerOk(EASelected.title!)
            }
            let EDAction = UIAlertAction.init(title: "Elective", style: .default) { (EDSelected) in
                
                alertHandlerOk(EDSelected.title!)
            }
            let TIAction = UIAlertAction.init(title: "Urgent", style: .default) { (TISelected) in
                
                alertHandlerOk(TISelected.title!)
            }
            
            alertController.addAction(EAAction)
            alertController.addAction(EDAction)
            alertController.addAction(TIAction)
           
        }
        
        else if textFieldName == "TobaccoUse"
        {
            let EAAction = UIAlertAction.init(title: "Current every day smoker", style: .default) { (EASelected) in
                alertHandlerOk(EASelected.title!)
            }
            let EDAction = UIAlertAction.init(title: "Current some day smoker", style: .default) { (EDSelected) in
                
                alertHandlerOk(EDSelected.title!)
            }
            let TIAction = UIAlertAction.init(title: "Former smoker", style: .default) { (TISelected) in
                
                alertHandlerOk(TISelected.title!)
            }
            let OTAction = UIAlertAction.init(title: "Never smoker", style: .default) { (OTSelected) in
                
                alertHandlerOk(OTSelected.title!)
            }
            let noneAction = UIAlertAction.init(title: "Smoker, current status (frequency) unknown", style: .default) { (noSelected) in
                
                alertHandlerOk(noSelected.title!)
            }
            let noReportAction = UIAlertAction.init(title: "Smoking status unknown", style: .default) { (NRSelected) in
                
                alertHandlerOk(NRSelected.title!)
            }
            
            alertController.addAction(EAAction)
            alertController.addAction(EDAction)
            alertController.addAction(TIAction)
            alertController.addAction(OTAction)
            alertController.addAction(noneAction)
            alertController.addAction(noReportAction)
        }
        
        alertController.popoverPresentationController?.sourceView = view
        alertController.popoverPresentationController?.sourceRect = CGRect(x:self.view.bounds.midX,y:self.view.bounds.midY,width:0,height:0)
        alertController.popoverPresentationController?.permittedArrowDirections = []
        self.present(alertController, animated: true, completion: nil)
        
        
    }
}
