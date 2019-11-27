//
//  DetailViewController.swift
//  STEMExpo
//
//  Created by brad.hontz on 11/13/19.
//  Copyright © 2019 brad.hontz. All rights reserved.
//

import UIKit
import FirebaseDatabase

class DetailViewController: UIViewController {
    
    @IBOutlet weak var lblCompany: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPhone: UILabel!
    @IBOutlet weak var lblACPower: UILabel!
    @IBOutlet weak var lblWiFi: UILabel!
    @IBOutlet weak var checkbox: Checkbox!
    
    var phonenbr: String!
    var ref: DatabaseReference!
    var refHandle: DatabaseHandle!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        
        checkbox.checkmarkStyle = .tick
        checkbox.checkmarkColor = .blue
        if selectedElement["COOKIES"] as? Int == 0 {
            checkbox.isChecked = false
        } else {
            checkbox.isChecked = true
        }
        
        checkbox.addTarget(self, action: #selector(checkboxValueChanged(sender:)), for: .valueChanged)
        
        // handle a click on the phone number label
        let tap = UITapGestureRecognizer(target: self, action: #selector(DetailViewController.tapPhoneNumber))
        lblPhone.isUserInteractionEnabled = true
        lblPhone.addGestureRecognizer(tap)
        lblPhone.text = selectedElement["Phone"] as? String
        
        lblCompany.text = selectedElement["Company"] as? String
        lblName.text = selectedElement["Name"] as? String
        lblACPower.text = selectedElement["ACPOWER"] as? String
        lblWiFi.text = selectedElement["WIFI"] as? String
        
        // This works!  Allows viewing a single node's value(s)
        refHandle = self.ref?.child("jsonFIRData").child("006").observe(.value, with: {(snapshop) in
            let name = value?["Name"] as? String ?? "bogus"
            print("The name is: \(name)")
        })
    }
    
    deinit {
        if refHandle != nil {
            self.ref?.child("jsonFIRData").child("004").removeObserver(withHandle: refHandle)
        }
    }
    
    @objc func checkboxValueChanged(sender: Checkbox) {
        //TODO: how to make this change persistant, even
        // while using the app!
        print("Checkbox value has changed: \(sender.isChecked)")
    }
    
    @objc func tapPhoneNumber(sender:UITapGestureRecognizer) {
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
