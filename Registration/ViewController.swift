//
//  ViewController.swift
//  Registration
//
//  Created by Abhishek Yadav on 28/02/20.
//  Copyright © 2020 Abhishek Yadav. All rights reserved.
//

import UIKit
import RealmSwift
class ViewController: UIViewController {

    
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var registrationBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print(Realm.Configuration.defaultConfiguration.fileURL!)
        btnActions()
    }
    
    func btnActions(){
        registerBtn.addTarget(self, action: #selector(actionRegister), for: .touchUpInside)
        registrationBtn.addTarget(self, action: #selector(actionRegistration), for: .touchUpInside)
    }
    
    @objc func actionRegister(){
        redirect(id: "VC1")
    }
    
    @objc func actionRegistration(){ 
        redirect(id: "VC2")
    }
    
    
    func redirect(id:String){
        let vc = storyboard?.instantiateViewController(identifier: id)
        present(vc!, animated: true, completion: nil)
    }
}
