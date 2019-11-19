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
    
    var phonenbr: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(DetailViewController.tapFunction))
        lblPhone.isUserInteractionEnabled = true
        lblPhone.addGestureRecognizer(tap)
        // handle a click on this label
        lblPhone.text = selectedElement["Phone"] as? String
        
        lblCompany.text = selectedElement["Company"] as? String
        lblName.text = selectedElement["Name"] as? String
        lblACPower.text = selectedElement["ACPOWER"] as? String
        lblWiFi.text = selectedElement["WIFI"] as? String

    }
    
    @objc func tapFunction(sender:UITapGestureRecognizer) {
        makePhoneCall(phoneNumber: lblPhone.text ?? "")
    
    }
    // presents an action dialog to cancel or place phone call
    func makePhoneCall(phoneNumber: String) {
        if let phoneURL = NSURL(string: ("tel://" + phoneNumber)) {

            let alert = UIAlertController(title: ("Call " + phoneNumber + " ?"), message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Call", style: .default, handler: { (action) in
                UIApplication.shared.open(phoneURL as URL, options: [:], completionHandler: nil)
            }))

            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
