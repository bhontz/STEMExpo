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
    
    var ref: DatabaseReference!
    private var refHandle: DatabaseHandle!
    
    var viewData:[Item] = [] {
        didSet {
            DispatchQueue.main.async {
                // prevents wiping out the tableview if the search bar query doesn't match anything
                if self.viewData.count == 0 {
                    self.fetchTableData()
                }
                self.expoTableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        SBar.delegate = self
//        self.viewData = sortedData  // if you want to hook up to the static data in stemExpo.swift
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
        // within the DetailView, if we checked we delivered cookies, then we strike through the cell text
        if r.delivered == 1 {
            cell.textLabel?.attributedText = strikeThroughText(r.company ?? "default")
        } else {
            cell.textLabel?.text = r.company
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let r = self.viewData[indexPath.row]
        keyPass = r.id
        performSegue(withIdentifier: "seque", sender: self)
    }
    
    func strikeThroughText (_ text:String) -> NSAttributedString {
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: text)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0, attributeString.length))
        return attributeString
    }
}

extension ViewController: UISearchBarDelegate {
        
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchBarText = searchBar.text else {return}
        self.viewData = self.viewData.filter({($0.company!).lowercased().contains(searchBarText.lowercased())})
        searchBar.endEditing(true)
    }
}
