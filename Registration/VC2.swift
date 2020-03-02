//
//  VC2.swift
//  Registration
//
//  Created by Abhishek Yadav on 02/03/20.
//  Copyright © 2020 Abhishek Yadav. All rights reserved.
//

import UIKit
import RealmSwift
class VC2: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var cancelOut: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cancelOut.addTarget(self, action: #selector(cancelBtn), for: .touchUpInside)
    }
    
    func getData()->Results<Employee>{
        let realm = try! Realm()
        let emps : Results<Employee> = realm.objects(Employee.self)
        return emps
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        getData().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DBTableViewCell") as! DBTableViewCell
        cell.fName.text = getData()[indexPath.row]["fName"] as? String
        cell.lName.text = getData()[indexPath.row]["lName"] as? String
        cell.email.text = getData()[indexPath.row]["email"] as? String
        cell.phone.text = getData()[indexPath.row]["phone"] as? String
        cell.gender.text = getData()[indexPath.row]["gender"] as? String
        return cell
    }
    
    @objc func cancelBtn(){
        dismiss(animated: true, completion: nil)
    }

}
