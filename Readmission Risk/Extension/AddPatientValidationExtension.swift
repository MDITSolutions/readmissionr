//
//  AddPatientValidationExtension.swift
//  Readmission Risk
//
//  Created by Somdev Choudhary on 14/01/18.
//  Copyright © 2018 Somdev Choudhary. All rights reserved.
//

import Foundation

extension UIViewController
{
    func validateAddPatient(_ nameStr:String,ageStr:String,dobStr:String,genderStr:String,heightStr:String,weightStr:String,arrivalDate:String,surgeryDate:String,skinCutStart:String,skinCutStop:String,lastCreatine:String,ejection:String,perfusion:String,crossClamp:String,lastA1:String,postOperative:String,admission:String,aorticInsufficiency:String,aorticOcclusion:String,cardiac:String,cshock:String,clung:String,diabets:String,discharge:String,incidence:String,mitral:String,nodcv:String,race:String,resuscitation:String,status:String,tobbaco:String,statusHandler:@escaping(_ flag:Bool) -> Void) {
        
        if nameStr == "" {
            
            showNormalAlertWithTitle(kAlertTitle, message: "Please fill name field")
            statusHandler(false)
        }
        else if ageStr == ""
        {
            showNormalAlertWithTitle(kAlertTitle, message: "Please fill age field")
             statusHandler(false)
        }
        else if dobStr == ""
        {
            showNormalAlertWithTitle(kAlertTitle, message: "Please fill dob field")
            statusHandler(false)
        }
        else if genderStr == ""
        {
            showNormalAlertWithTitle(kAlertTitle, message: "Please fill gender field")
            statusHandler(false)
        }
        else if heightStr == ""
        {
            showNormalAlertWithTitle(kAlertTitle, message: "Please fill height field")
            statusHandler(false)
        }
        else if weightStr == ""
        {
            showNormalAlertWithTitle(kAlertTitle, message: "Please fill weight field")
            statusHandler(false)
        }
        else if arrivalDate == ""
        {
            showNormalAlertWithTitle(kAlertTitle, message: "Please fill arrival date field")
            statusHandler(false)
        }
        else if surgeryDate == ""
        {
            showNormalAlertWithTitle(kAlertTitle, message: "Please fill surgery date field")
            statusHandler(false)
        }
        else if skinCutStart == ""
        {
            showNormalAlertWithTitle(kAlertTitle, message: "Please fill skin cut start time field")
            statusHandler(false)
        }
        else if skinCutStop == ""
        {
            showNormalAlertWithTitle(kAlertTitle, message: "Please fill skin cut stop time field")
            statusHandler(false)
        }
        else if lastCreatine == ""
        {
            showNormalAlertWithTitle(kAlertTitle, message: "Please fill last creatinine field")
            statusHandler(false)
        }
        else if ejection == ""
        {
            showNormalAlertWithTitle(kAlertTitle, message: "Please fill ejection fraction field")
            statusHandler(false)
        }
        else if perfusion == ""
        {
            showNormalAlertWithTitle(kAlertTitle, message: "Please fill perfusion time field")
            statusHandler(false)
        }
        else if crossClamp == ""
        {
            showNormalAlertWithTitle(kAlertTitle, message: "Please fill cross clamp time field")
            statusHandler(false)
        }
        else if lastA1 == ""
        {
            showNormalAlertWithTitle(kAlertTitle, message: "Please fill last A1C Level field")
            statusHandler(false)
        }
        else if postOperative == ""
        {
            showNormalAlertWithTitle(kAlertTitle, message: "Please fill post-operative ventilation time field")
            statusHandler(false)
        }
        else if admission == ""
        {
            showNormalAlertWithTitle(kAlertTitle, message: "Please select any admission source option")
            statusHandler(false)
        }
        else if aorticInsufficiency == ""
        {
            showNormalAlertWithTitle(kAlertTitle, message: "Please select any aortic insufficiency option")
            statusHandler(false)
        }
        else if aorticOcclusion == ""
        {
            showNormalAlertWithTitle(kAlertTitle, message: "Please select any aortic occlusion option")
            statusHandler(false)
        }
        else if cardiac == ""
        {
            showNormalAlertWithTitle(kAlertTitle, message: "Please select any cardiac presentation at admission option")
            statusHandler(false)
        }
        else if cshock == ""
        {
            showNormalAlertWithTitle(kAlertTitle, message: "Please select any cardiogenic shock option")
            statusHandler(false)
        }
        else if clung == ""
        {
            showNormalAlertWithTitle(kAlertTitle, message: "Please select any chronic lung disease option")
            statusHandler(false)
        }
        else if diabets == ""
        {
            showNormalAlertWithTitle(kAlertTitle, message: "Please select any diabetes control option")
            statusHandler(false)
        }
        else if discharge == ""
        {
            showNormalAlertWithTitle(kAlertTitle, message: "Please select any discharge location option")
            statusHandler(false)
        }
        else if incidence == ""
        {
            showNormalAlertWithTitle(kAlertTitle, message: "Please select any incidence option")
            statusHandler(false)
        }
        else if mitral == ""
        {
            showNormalAlertWithTitle(kAlertTitle, message: "Please select any mitral insufficiency option")
            statusHandler(false)
        }
        else if nodcv == ""
        {
            showNormalAlertWithTitle(kAlertTitle, message: "Please select any number of disease coronery vessels option")
            statusHandler(false)
        }
        else if race == ""
        {
            showNormalAlertWithTitle(kAlertTitle, message: "Please select any race option")
            statusHandler(false)
        }
        else if resuscitation == ""
        {
            showNormalAlertWithTitle(kAlertTitle, message: "Please select any resuscitation option")
            statusHandler(false)
        }
        else if status == ""
        {
            showNormalAlertWithTitle(kAlertTitle, message: "Please select any status option")
            statusHandler(false)
        }
        else if tobbaco == ""
        {
            showNormalAlertWithTitle(kAlertTitle, message: "Please select any tobbaco use option")
            statusHandler(false)
        }
        else
        {
            statusHandler(true)
        }
        
    }
}
