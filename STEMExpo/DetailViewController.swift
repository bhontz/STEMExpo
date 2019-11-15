//
//  DetailViewController.swift
//  STEMExpo
//
//  Created by brad.hontz on 11/13/19.
//  Copyright © 2019 brad.hontz. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var lblCompany: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPhone: UILabel!
    @IBOutlet weak var lblACPower: UILabel!
    @IBOutlet weak var lblWiFi: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblCompany.text = sortedData[intSelectedIndex]["Company"] as? String
        lblName.text = sortedData[intSelectedIndex]["Name"] as? String
        lblPhone.text = sortedData[intSelectedIndex]["Phone"] as? String
        lblACPower.text = sortedData[intSelectedIndex]["ACPOWER"] as? String
        lblWiFi.text = sortedData[intSelectedIndex]["WIFI"] as? String

    }
}
