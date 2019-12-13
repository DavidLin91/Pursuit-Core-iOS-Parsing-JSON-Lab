//
//  DetailedUserGeneratorVC.swift
//  parsingJSONlab
//
//  Created by David Lin on 12/5/19.
//  Copyright © 2019 David Lin (Passion Proj). All rights reserved.
//

import UIKit

class DetailedUserGeneratorVC: UIViewController {
    var detailedUsers: RandomUsers!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var dobLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }

    func loadData() {
        fullNameLabel.text = "Address: \(detailedUsers.location.street.name)  \(detailedUsers.location.street.number.description)"
        phoneNumberLabel.text = " Number: \(detailedUsers.phone.description)"
        dobLabel.text = "DOB: \(detailedUsers.dob.date)"
    }
    
}
