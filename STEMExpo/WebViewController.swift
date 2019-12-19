//
//  WebViewController.swift
//  STEMExpo
//
//  Created by brad.hontz on 12/18/19.
//  Copyright © 2019 brad.hontz. All rights reserved.
//

import UIKit
import WebKit
import FirebaseDatabase

class WebViewController: UIViewController {

    @IBOutlet weak var webview: WKWebView!
    var selectedElement: [String:Any]!  // retaining the structure of the Firebase node
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        fetchNode {
            super.viewDidAppear(animated)
            var urlDestination:String?
            if let unwrapped:Any = self.selectedElement["URL"] {
                urlDestination = unwrapped as? String
            } else {
                urlDestination = "https://www.apple.com"
            }
            let url:URL = URL(string: urlDestination!)!
            let urlRequest:URLRequest = URLRequest(url: url)
            self.webview.load(urlRequest)
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
    
}
