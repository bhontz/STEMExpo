//
//  ViewController.swift
//  STEMExpo
//
//  Created by brad.hontz on 11/13/19.
//  Copyright © 2019 brad.hontz. All rights reserved.
//


import UIKit
import FirebaseDatabase

var selectedElement: [String:Any]!
var newData = [[String:Any]]()

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var expoTableView: UITableView!
    @IBOutlet weak var SBar: UISearchBar!

    var ref: DatabaseReference!
    var refHandle: DatabaseHandle!
    
    var viewData:[[String:Any]]! {
        didSet {
            DispatchQueue.main.async {
                self.expoTableView.reloadData()
                // HACK BELOW: this assures that a search term that
                // doesn't match ANYTHING returns EVERYTHING
                if self.viewData.count == 0 {
                    self.viewData = sortedData
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        SBar.delegate = self
//        self.viewData = sortedData
        ref = Database.database().reference()
        refHandle = self.ref?.child("jsonFIRData").observe(.childAdded, with: {(snapshop) in
            let node = snapshop.value as? [String:Any]
            if let actualnode = node {
                newData.append(actualnode)
                
                newData = (newData as NSArray).sortedArray(using: [NSSortDescriptor(key: "Company", ascending: true)]) as! [[String:Any]]
                
                self.expoTableView.reloadData()
            }
        })
    }
    
    deinit {
        if refHandle != nil {
            self.ref?.child("jsonFIRData").removeObserver(withHandle: refHandle)
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return self.viewData.count
        return newData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let r = newData[indexPath.row]
        cell.textLabel?.text = r["Company"] as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedElement = newData[indexPath.row]
        performSegue(withIdentifier: "seque", sender: self)
    }

//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell()
//        refHandle = self.ref?.child("jsonFIRData").observe(.childAdded, with: {(snapshop) in
//            newData.append(snapshop.value as! [String : Any])
//            print("The name is: \(String(describing: dictNode?["Name"] as? String))")
//            cell.textLabel?.text = (dictNode?["Company"] as! String)
//        })
//        return cell
//    }
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell()
//        let r = self.viewData[indexPath.row]
//        cell.textLabel?.text = r["Company"] as? String
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        selectedElement = self.viewData[indexPath.row]
//        intSelectedIndex = indexPath.row
//        performSegue(withIdentifier: "seque", sender: self)
//    }
    
}

//extension ViewController: UISearchBarDelegate {
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        guard let searchBarText = searchBar.text else {return}
//        if searchBarText.lowercased() == "help" {
//            self.viewData = sortedData
//        }
//        // print(searchBarText)
//        newData = newData.filter({($0["Company"] as! String).lowercased().contains(searchBarText.lowercased())})
//
////        self.viewData = self.viewData.filter({($0["Company"] as! String).lowercased().contains(searchBarText.lowercased())})
//    }
//}


