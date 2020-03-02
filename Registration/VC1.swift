//
//  VC1.swift
//  Registration
//
//  Created by Abhishek Yadav on 02/03/20.
//  Copyright © 2020 Abhishek Yadav. All rights reserved.
//

import UIKit
import RealmSwift

class VC1: UIViewController {
    
    @IBOutlet weak var fnameTF: UITextField!
    @IBOutlet weak var lnameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passTF: UITextField!
    @IBOutlet weak var pass2TF: UITextField!
    @IBOutlet weak var numberTF: UITextField!
    var gender : String?
    
    @IBOutlet weak var maleOut: UIButton!
    @IBOutlet weak var femaleOut: UIButton!
    @IBOutlet weak var otherOut: UIButton!
    
    @IBOutlet weak var cancelOut: UIButton!
    @IBOutlet weak var registerOut: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        maleOut.addTarget(self, action: #selector(maleBtn), for: .touchUpInside)
        femaleOut.addTarget(self, action: #selector(femaleBtn), for: .touchUpInside)
        otherOut.addTarget(self, action: #selector(otherBtn), for: .touchUpInside)
        cancelOut.addTarget(self, action: #selector(cancelBtn), for: .touchUpInside)
        registerOut.addTarget(self, action: #selector(dbRealm), for: .touchUpInside)
        
    }
    
    @objc func maleBtn(){
        maleOut.setImage(#imageLiteral(resourceName: "radioFill"), for: .normal)
        femaleOut.setImage(#imageLiteral(resourceName: "radio"), for: .normal)
        otherOut.setImage(#imageLiteral(resourceName: "radio"), for: .normal)
        gender = "Male"
    }
    
    @objc func femaleBtn(){
        femaleOut.setImage(#imageLiteral(resourceName: "radioFill"), for: .normal)
        maleOut.setImage(#imageLiteral(resourceName: "radio"), for: .normal)
        otherOut.setImage(#imageLiteral(resourceName: "radio"), for: .normal)
        gender = "Female"
    }
    
    @objc func otherBtn(){
        otherOut.setImage(#imageLiteral(resourceName: "radioFill"), for: .normal)
        femaleOut.setImage(#imageLiteral(resourceName: "radio"), for: .normal)
        maleOut.setImage(#imageLiteral(resourceName: "radio"), for: .normal)
        gender = "Other"
    }
    
    @objc func cancelBtn(){
        dismiss(animated: true, completion: nil)
    }
    
    
    @objc func dbRealm(){
        if fnameTF.text!.isEmpty{
            alerts(msg: "First name")
        }else if lnameTF.text!.isEmpty{
            alerts(msg: "Last name")
        }else if emailTF.text!.isEmpty{
            alerts(msg: "Email")
        }else if passTF.text!.isEmpty{
            alerts(msg: "Password")
        }else if pass2TF.text!.isEmpty{
            alerts(msg: "Confirm password")
        }else if numberTF.text!.isEmpty{
            alerts(msg: "Phone number")
        }else if gender == nil {
            alerts(msg: "Gender")
        }else{
            let realm = try! Realm()
            let emp = Employee()
            emp.fName = fnameTF.text
            emp.lName = lnameTF.text
            emp.email = emailTF.text
            emp.phone = numberTF.text
            emp.gender = gender
            
            try! realm.write {
                realm.add(emp)
            }
        }
        dismiss(animated: true, completion: nil)
    }
    
    func alerts(msg:String){
        let ac = UIAlertController(title: "Alert", message: "\(msg) is Empty", preferredStyle: .alert)
        let aaction = UIAlertAction(title: "OK", style: .default, handler: nil)
        ac.addAction(aaction)
        present(ac, animated: true, completion: nil)
    }
    
}

class Employee : Object{
    @objc dynamic var fName : String?
    @objc dynamic var lName : String?
    @objc dynamic var gender : String?
    @objc dynamic var email : String?
    @objc dynamic var phone : String?
}
