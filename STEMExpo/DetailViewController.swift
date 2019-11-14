//
//  DetailViewController.swift
//  STEMExpo
//
//  Created by brad.hontz on 11/13/19.
//  Copyright © 2019 brad.hontz. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var lblName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblName.text = strTempName
    }
}
