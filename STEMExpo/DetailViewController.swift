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
    var selectedElement: [String:Any]!  // retaining the structure of the Firebase node
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        checkbox.borderStyle = .square
        checkbox.checkmarkColor = .systemYellow
        checkbox.checkmarkStyle = .cross
        checkbox.addTarget(self, action: #selector(checkboxValueChanged(sender:)), for: .valueChanged)

        fetchNode() {
            
            if self.selectedElement["COOKIES"] as? Int == 0 {
                self.checkbox.isChecked = false
            } else {
                self.checkbox.isChecked = true
            }
            
            let tap = UITapGestureRecognizer(target: self, action: #selector(DetailViewController.tapPhoneNumber))
            self.lblPhone.isUserInteractionEnabled = true
            self.lblPhone.addGestureRecognizer(tap)
            // handle a click on this label
            self.lblPhone.text = self.selectedElement["Phone"] as? String
            
            self.lblCompany.text = self.selectedElement["Company"] as? String
            self.lblName.text = self.selectedElement["Name"] as? String
            self.lblACPower.text = self.selectedElement["ACPOWER"] as? String
            self.lblWiFi.text = self.selectedElement["WIFI"] as? String
        }
    }
    
    func fetchNode(_ completion: @escaping () -> Void) {
        ref = Database.database().reference(withPath: "jsonFIRData")
        ref.child(keyPass).observeSingleEvent(of: .value, with: { (snapshot) in
            self.selectedElement = snapshot.value as? [String:Any]
            completion()
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    // write to Firebase based upon the checkbox status
    @objc func checkboxValueChanged(sender: Checkbox) {
        if sender.isChecked {
            self.ref.child(keyPass).child("COOKIES").setValue(1)
        } else {
            self.ref.child(keyPass).child("COOKIES").setValue(0)
        }
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
