//
//  ViewController.swift
//  STEMExpo
//
//  Created by brad.hontz on 11/13/19.
//  Copyright © 2019 brad.hontz. All rights reserved.
//

/*
 to restore the search bar functionality, you should break out the firebase read into a function ala DetailedViewController, as you should be able to 'refresh' the view after filtering (here assuming
 you filtered on the viewData array only].   Alternatively, you could consider extending the new function
 mentioned above to allow passing the search string text which you could use to filter the call directly
 from firebase.
 
 */

import UIKit
import FirebaseDatabase

var selectedElement: [String:Any]!
var keyPass: String!

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var expoTableView: UITableView!
    @IBOutlet weak var SBar: UISearchBar!
    var viewData = [Item]()
    var ref: DatabaseReference!
    private var refHandle: DatabaseHandle!

    //    // use this to detect changes in your array after a search bar query
//    var viewData:[[String:Any]]! {
//        didSet {
//            DispatchQueue.main.async {
//                self.expoTableView.reloadData()
//                // HACK BELOW: this assures that a search term that
//                // doesn't match ANYTHING returns EVERYTHING
//                if self.viewData.count == 0 {
//                    self.viewData = sortedData
//                }
//            }
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        SBar.delegate = self
//        self.viewData = sortedData
        fetchTableData()
    }
    
    func fetchTableData(){
        ref = Database.database().reference(withPath: "jsonFIRData")
        refHandle = ref.observe(.value, with: { snapshot in
            var newItems = [Item]()
            for child in snapshot.children {
                let item = Item(snapshot: child as! DataSnapshot)
                newItems.append(item)
            }
            self.viewData = newItems.sorted(by: {$0.company! < $1.company!})
            self.expoTableView.reloadData()
        })
    }
    
    deinit {
        if refHandle != nil {
            ref.child("jsonFIRData").removeObserver(withHandle: refHandle)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let r = self.viewData[indexPath.row]
        cell.textLabel?.text = r.company
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let r = self.viewData[indexPath.row]
        keyPass = r.id
        performSegue(withIdentifier: "seque", sender: self)
    }
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


