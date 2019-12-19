//
//  stemEXPO.swift
//  STEMExpo
//  SALK - this module contains a global data variable containing all of the data for our app
//  as well as a 'sortedData' global variable which is
//  where we'll hold a sorted copy of the data.   Sorting
//  occurs within AppDelegate.swift method launchOptions
//
//  Created by brad.hontz on 11/13/19.
//  Copyright © 2019 brad.hontz. All rights reserved.
//

import Foundation
import FirebaseDatabase

// this is used in the ViewController as the TableView populator
class Item {
    var ref: DatabaseReference?
    var id: String?
    var company: String?
    var delivered: Int?
    var url: String?
    
    init (snapshot: DataSnapshot) {
        ref = snapshot.ref
        id = snapshot.key
        let data = snapshot.value as! [String:Any]
        company = data["Company"] as? String
        delivered = data["COOKIES"] as? Int
        url = data["URL"] as? String
    }
}


// this stuff below was my original attempt at working with the
// tableview within the ViewController module - here I'd simply imported
// data into Swift's dictionary view format (slightly different format from JSON)

var sortedData: [[String:Any]] = jsonData

var jsonData: [[String: Any]] =
[["Company": "Orange County Crime Lab", "Name": "Vanessa Meneses", "Phone": "xxx-xxx-xxxx", "NTABLES": "2", "ACPOWER": "No", "WIFI": "Yes", "COOKIES": 0],
["Company": "STEMup4Youth", "Name": "Megan Loh", "Phone": "xxx-xxx-xxxx", "NTABLES": "1", "ACPOWER": "No", "WIFI": "No", "COOKIES": 0],
["Company": "Ericsson", "Name": "Chaitri Aroskar", "Phone": "xxx-xxx-xxxx", "NTABLES": "4", "ACPOWER": "Yes", "WIFI": "Yes", "COOKIES": 0],
["Company": "Aquarium of the Pacific", "Name": "Leah Young", "Phone": "xxx-xxx-xxxx", "NTABLES": "1", "ACPOWER": "No", "WIFI": "No", "COOKIES": 0],
["Company": "Project Scientist", "Name": "Sandy Marshall", "Phone": "xxx-xxx-xxxx", "NTABLES": "2", "ACPOWER": "No", "WIFI": "No", "COOKIES": 0],
["Company": "Amigos De Bolsa Chica", "Name": "Thomas Anderson", "Phone": "xxx-xxx-xxxx", "NTABLES": "2", "ACPOWER": "Yes", "WIFI": "No", "COOKIES": 0],
["Company": "SWE Orange County Professional Section", "Name": "Natalie White", "Phone": "xxx-xxx-xxxx", "NTABLES": "1", "ACPOWER": "No", "WIFI": "No", "COOKIES": 0],
["Company": "Techtacular", "Name": "Shivana Anand", "Phone": "xxx-xxx-xxxx", "NTABLES": "3", "ACPOWER": "No", "WIFI": "Yes", "COOKIES": 0],
["Company": "Kaiser Permanente", "Name": "Careen Campbell", "Phone": "xxx-xxx-xxxx", "NTABLES": "2", "ACPOWER": "Yes", "WIFI": "No", "COOKIES": 0],
["Company": "Bolsa Chica Conservancy", "Name": "Jeannette Bush", "Phone": "xxx-xxx-xxxx", "NTABLES": "1", "ACPOWER": "No", "WIFI": "No", "COOKIES": 0],
["Company": "Raytheon", "Name": "Jill Katsuda", "Phone": "xxx-xxx-xxxx", "NTABLES": "2", "ACPOWER": "No", "WIFI": "No", "COOKIES": 0],
["Company": "GEARup4Youth", "Name": "Megan Loh", "Phone": "xxx-xxx-xxxx", "NTABLES": "1", "ACPOWER": "Yes", "WIFI": "Yes", "COOKIES": 0],
["Company": "the Coder School", "Name": "Mark Freedkin", "Phone": "xxx-xxx-xxxx", "NTABLES": "3", "ACPOWER": "Yes", "WIFI": "Yes", "COOKIES": 0],
["Company": "Northrop Grumman Corporation", "Name": "Laura Otero", "Phone": "xxx-xxx-xxxx", "NTABLES": "2", "ACPOWER": "No", "WIFI": "No", "COOKIES": 0],
["Company": "Loma Linda Childrens Hospital", "Name": "Jamie Jones", "Phone": "xxx-xxx-xxxx", "NTABLES": "2", "ACPOWER": "Yes", "WIFI": "Yes", "COOKIES": 0],
["Company": "Garner Holt Education through Imaginatio", "Name": "Dolores Delgado", "Phone": "xxx-xxx-xxxx", "NTABLES": "3", "ACPOWER": "Yes", "WIFI": "Yes", "COOKIES": 0],
["Company": "STEAM for All: OC Science", "Name": "Emily Zhang", "Phone": "xxx-xxx-xxxx", "NTABLES": "2", "ACPOWER": "No", "WIFI": "No", "COOKIES": 0],
["Company": "Magikid Robotics Lab", "Name": "Brooke Bierling", "Phone": "xxx-xxx-xxxx", "NTABLES": "3", "ACPOWER": "No", "WIFI": "No", "COOKIES": 0],
["Company": "Coastline College", "Name": "Tobi West", "Phone": "xxx-xxx-xxxx", "NTABLES": "2", "ACPOWER": "Yes", "WIFI": "Yes", "COOKIES": 0],
["Company": "Municipal Water District of Orange County", "Name": "Sarah Wilson", "Phone": "xxx-xxx-xxxx", "NTABLES": "2", "ACPOWER": "No", "WIFI": "No", "COOKIES": 0],
["Company": "Play-Well TEKnologies", "Name": "Chrissy Close", "Phone": "xxx-xxx-xxxx", "NTABLES": "3", "ACPOWER": "No", "WIFI": "No", "COOKIES": 0],
["Company": "Medtronic", "Name": "Morgan Zandonella", "Phone": "xxx-xxx-xxxx", "NTABLES": "1", "ACPOWER": "Yes", "WIFI": "No", "COOKIES": 0],
["Company": "Discovery Cube Orange County", "Name": "Georgette Frierson", "Phone": "xxx-xxx-xxxx", "NTABLES": "1", "ACPOWER": "Yes", "WIFI": "Yes", "COOKIES": 0],
["Company": "Code Gauchos, Inc.", "Name": "Timothy Sandberg", "Phone": "xxx-xxx-xxxx", "NTABLES": "2", "ACPOWER": "Yes", "WIFI": "Yes", "COOKIES": 0],
["Company": "Cyber Youth Tech (CyTech)", "Name": "Charissa Kim", "Phone": "xxx-xxx-xxxx", "NTABLES": "2", "ACPOWER": "No", "WIFI": "Yes", "COOKIES": 0],
["Company": "All Girls Math Tournament", "Name": "Sabreen Alam", "Phone": "xxx-xxx-xxxx", "NTABLES": "2", "ACPOWER": "No", "WIFI": "No", "COOKIES": 0],
["Company": "Bionerds", "Name": "Diana Dizon", "Phone": "xxx-xxx-xxxx", "NTABLES": "2", "ACPOWER": "Yes", "WIFI": "No", "COOKIES": 0],
["Company": "Orange County Department of Education", "Name": "Omar Shepherd", "Phone": "xxx-xxx-xxxx", "NTABLES": "2", "ACPOWER": "Yes", "WIFI": "Yes", "COOKIES": 0],
["Company": "Bio-Rad Laboratories", "Name": "Michelle Conard", "Phone": "xxx-xxx-xxxx", "NTABLES": "2", "ACPOWER": "No", "WIFI": "No", "COOKIES": 0],
["Company": "Michael Baker International", "Name": "Anisha Malik", "Phone": "xxx-xxx-xxxx", "NTABLES": "2", "ACPOWER": "No", "WIFI": "No", "COOKIES": 0],
["Company": "Science Scoop", "Name": "Lexie Howell", "Phone": "xxx-xxx-xxxx", "NTABLES": "2", "ACPOWER": "No", "WIFI": "No", "COOKIES": 0]]

// Here's how to print the structure above
//for r in jsonData {
//    r.forEach {k, v in
//        print ("key: \(k) value: \(v)")
//    }
//    print ("--------------------------------------")
//}
