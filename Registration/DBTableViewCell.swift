//
//  DBTableViewCell.swift
//  Registration
//
//  Created by Abhishek Yadav on 02/03/20.
//  Copyright © 2020 Abhishek Yadav. All rights reserved.
//

import UIKit

class DBTableViewCell: UITableViewCell {

    @IBOutlet weak var fName: UILabel!
    @IBOutlet weak var lName: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var gender: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

}
