//
//  ViewController.swift
//  STEMExpo
//
//  Created by brad.hontz on 11/13/19.
//  Copyright © 2019 brad.hontz. All rights reserved.
//


import UIKit

var strTempName:String = ""

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var expoTableView: UITableView!
    @IBOutlet weak var SBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SBar.delegate = self
        // Do any additional setup after loading the view.
    }

    let jsonSorted = (jsonData as NSArray).sortedArray(using: [NSSortDescriptor(key: "Company", ascending: true)]) as! [[String:Any]]
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jsonSorted.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let r = jsonSorted[indexPath.row]
        cell.textLabel?.text = r["Company"] as? String
        return cell
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let r = jsonSorted[indexPath.row]
        strTempName = r["Name"] as? String ?? "Empty"
        print(strTempName)
        performSegue(withIdentifier: "seque", sender: self)
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchBarText = searchBar.text else {return}
        print(searchBarText)
    }
}


