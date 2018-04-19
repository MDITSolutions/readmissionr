//
//  DashboardVC.swift
//  Readmission Risk
//
//  Created by Somdev Choudhary on 06/12/17.
//  Copyright © 2017 Somdev Choudhary. All rights reserved.
//

import UIKit

class DashboardVC: UIViewController {
    
    @IBOutlet weak var addPatient_btn:UIButton!
    @IBOutlet weak var myPatient_btn:UIButton!
    @IBOutlet weak var addPatient_Lbl:UILabel!
    @IBOutlet weak var myPatient_Lbl:UILabel!
    @IBOutlet weak var myContentView:UIView!
    @IBOutlet weak var dashboardTime_Lbl:UILabel!
    
    var conditionsArr:Array<String>! = []
    
    var checkTabStatus:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        makeRoundedCorners()
        
        myPatient_Lbl.textColor = UIColor.white
        
        self.addChildViewControllerOnContentView(false)
        
        let date = Date()
        let formatter = DateFormatter()
        
        formatter.dateFormat = "hh:mm a"
        let dateTimeResult = formatter.string(from: date)
        
        formatter.dateFormat = "dd-MMM-yyyy"
        let dateResult = formatter.string(from: date)
        
        dashboardTime_Lbl.text = dateTimeResult + " | " + dateResult
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK:- Make Rounded corners
    
    func makeRoundedCorners() {
        
        // ********************* Add Patient button corners ********************
        
        let rectShape = CAShapeLayer()
        rectShape.bounds = self.addPatient_btn.frame
        rectShape.position = self.addPatient_btn.center
        rectShape.path = UIBezierPath(roundedRect: self.addPatient_btn.bounds, byRoundingCorners: [.bottomLeft ,.topLeft], cornerRadii: CGSize(width: 5, height: 5)).cgPath
        
       // self.addPatient_btn.layer.backgroundColor = UIColor.green.cgColor
        self.addPatient_btn.layer.mask = rectShape
        
        // ********************* My Patient button corners ********************
        
        let rectPatientShape = CAShapeLayer()
        rectPatientShape.bounds = self.myPatient_btn.frame
        rectPatientShape.position = self.myPatient_btn.center
        rectPatientShape.path = UIBezierPath(roundedRect: self.myPatient_btn.bounds, byRoundingCorners: [.bottomLeft ,.topLeft], cornerRadii: CGSize(width: 5, height: 5)).cgPath
        
        // self.addPatient_btn.layer.backgroundColor = UIColor.green.cgColor
        self.myPatient_btn.layer.mask = rectPatientShape
    }
    
    // MARK:- Textfield Delegate
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        print("textfield")
    }
    
    // MARK:- IBAction
    
    @IBAction func addPatient_btnTapped(_ sender:UIButton)
    {
        if checkTabStatus
        {
            checkTabStatus = false
            addPatient_btn.backgroundColor = UIColor.init(red: 231/255, green: 232/255, blue: 238/255, alpha: 1)
            
            addPatient_btn.setImage(#imageLiteral(resourceName: "icon-add-patient-active"), for: .normal)
            myPatient_btn.setImage(#imageLiteral(resourceName: "icon-patients-regular"), for: .normal)
            
            
            myPatient_btn.backgroundColor = UIColor.clear
            myPatient_Lbl.textColor = UIColor.white
            addPatient_Lbl.textColor = UIColor.darkGray
            
            removeChildViewFromParent()
            self.addChildViewControllerOnContentView(false)
        }
        
    }
    
    @IBAction func myPatient_btnTapped(_ sender:UIButton)
    {
        if !checkTabStatus
        {
            checkTabStatus = true
            myPatient_btn.backgroundColor = UIColor.init(red: 231/255, green: 232/255, blue: 238/255, alpha: 1)
            
            myPatient_btn.setImage(#imageLiteral(resourceName: "icon-patients-active"), for: .normal)
            addPatient_btn.setImage(#imageLiteral(resourceName: "icon-add-patient-regular"), for: .normal)
            
            addPatient_btn.backgroundColor = UIColor.clear
            myPatient_Lbl.textColor = UIColor.darkGray
            addPatient_Lbl.textColor = UIColor.white
            
            removeChildViewFromParent()
            self.addChildViewControllerOnContentView(true)
        }
        
    }

    // MARK:- Add Child View Controller
    
    func addChildViewControllerOnContentView(_ flagCheck:Bool) {
        
        if flagCheck
        {
            let myPatient = self.storyboard?.instantiateViewController(withIdentifier: "MyPatientVC") as! MyPatientVC
            
            myPatient.view.frame = myContentView.bounds
            addChildViewController(myPatient)
            myContentView.addSubview(myPatient.view)
            myPatient.didMove(toParentViewController: self)
        }
        else
        {
            let addPatient = self.storyboard?.instantiateViewController(withIdentifier: "AddPatientVC") as! AddPatientVC
            
            addPatient.view.frame = myContentView.bounds
            addChildViewController(addPatient)
            myContentView.addSubview(addPatient.view)
            addPatient.didMove(toParentViewController: self)
        }
        
    }
    
    // MARK:- Remove Child from Parent
    
    func removeChildViewFromParent() {
        
        guard let vc = self.childViewControllers.last else {
            return
        }
        vc.willMove(toParentViewController: nil)
        vc.view.removeFromSuperview()
        vc.removeFromParentViewController()
    }
    
}

