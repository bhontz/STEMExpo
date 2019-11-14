//
//  stemEXPO.swift
//  STEMExpo
//
//  Created by brad.hontz on 11/13/19.
//  Copyright © 2019 brad.hontz. All rights reserved.
//

import Foundation

var jsonData: [[String: Any]] =
[["Company": "Orange County Crime Lab", "Name": "Vanessa Meneses", "Phone": "562-453-9899", "NTABLES": "2", "ACPOWER": "No", "WIFI": "Yes", "COOKIES": 0],
["Company": "STEMup4Youth", "Name": "Megan Loh", "Phone": "714-874-6381", "NTABLES": "1", "ACPOWER": "No", "WIFI": "No", "COOKIES": 0],
["Company": "Ericsson", "Name": "Chaitri Aroskar", "Phone": "972-567-7346", "NTABLES": "4", "ACPOWER": "Yes", "WIFI": "Yes", "COOKIES": 0],
["Company": "Aquarium of the Pacific", "Name": "Leah Young", "Phone": "562-715-8084", "NTABLES": "1", "ACPOWER": "No", "WIFI": "No", "COOKIES": 0],
["Company": "Project Scientist", "Name": "Sandy Marshall", "Phone": "833-776-5724", "NTABLES": "2", "ACPOWER": "No", "WIFI": "No", "COOKIES": 0],
["Company": "Amigos De Bolsa Chica", "Name": "Thomas Anderson", "Phone": "714-840-1575", "NTABLES": "2", "ACPOWER": "Yes", "WIFI": "No", "COOKIES": 0],
["Company": "SWE Orange County Professional Section", "Name": "Natalie White", "Phone": "817-909-5933", "NTABLES": "1", "ACPOWER": "No", "WIFI": "No", "COOKIES": 0],
["Company": "Techtacular", "Name": "Shivana Anand", "Phone": "949-887-0194", "NTABLES": "3", "ACPOWER": "No", "WIFI": "Yes", "COOKIES": 0],
["Company": "Kaiser Permanente", "Name": "Careen Campbell", "Phone": "714-644-5529", "NTABLES": "2", "ACPOWER": "Yes", "WIFI": "No", "COOKIES": 0],
["Company": "Bolsa Chica Conservancy", "Name": "Jeannette Bush", "Phone": "714-846-1114", "NTABLES": "1", "ACPOWER": "No", "WIFI": "No", "COOKIES": 0],
["Company": "Raytheon", "Name": "Jill Katsuda", "Phone": "562-972-4254", "NTABLES": "2", "ACPOWER": "No", "WIFI": "No", "COOKIES": 0],
["Company": "GEARup4Youth", "Name": "Megan Loh", "Phone": "714-874-6381", "NTABLES": "1", "ACPOWER": "Yes", "WIFI": "Yes", "COOKIES": 0],
["Company": "the Coder School", "Name": "Mark Freedkin", "Phone": "949-655-0388", "NTABLES": "3", "ACPOWER": "Yes", "WIFI": "Yes", "COOKIES": 0],
["Company": "Northrop Grumman Corporation", "Name": "Laura Otero", "Phone": "310-813-9237", "NTABLES": "2", "ACPOWER": "No", "WIFI": "No", "COOKIES": 0],
["Company": "Loma Linda Childrens Hospital", "Name": "Jamie Jones", "Phone": "909-374-6568", "NTABLES": "2", "ACPOWER": "Yes", "WIFI": "Yes", "COOKIES": 0],
["Company": "Garner Holt Education through Imaginatio", "Name": "Dolores Delgado", "Phone": "909-800-7972", "NTABLES": "3", "ACPOWER": "Yes", "WIFI": "Yes", "COOKIES": 0],
["Company": "STEAM for All: OC Science", "Name": "Emily Zhang", "Phone": "949-537-9675", "NTABLES": "2", "ACPOWER": "No", "WIFI": "No", "COOKIES": 0],
["Company": "Magikid Robotics Lab", "Name": "Brooke Bierling", "Phone": "949-390-9333", "NTABLES": "3", "ACPOWER": "No", "WIFI": "No", "COOKIES": 0],
["Company": "Coastline College", "Name": "Tobi West", "Phone": "949-945-3925", "NTABLES": "2", "ACPOWER": "Yes", "WIFI": "Yes", "COOKIES": 0],
["Company": "Municipal Water District of Orange County", "Name": "Sarah Wilson", "Phone": "714-593-5029", "NTABLES": "2", "ACPOWER": "No", "WIFI": "No", "COOKIES": 0],
["Company": "Play-Well TEKnologies", "Name": "Chrissy Close", "Phone": "714-861-9807", "NTABLES": "3", "ACPOWER": "No", "WIFI": "No", "COOKIES": 0],
["Company": "Medtronic", "Name": "Morgan Zandonella", "Phone": "775-813-4545", "NTABLES": "1", "ACPOWER": "Yes", "WIFI": "No", "COOKIES": 0],
["Company": "Discovery Cube Orange County", "Name": "Georgette Frierson", "Phone": "714-913-5012", "NTABLES": "1", "ACPOWER": "Yes", "WIFI": "Yes", "COOKIES": 0],
["Company": "Code Gauchos, Inc.", "Name": "Timothy Sandberg", "Phone": "949-681-6948", "NTABLES": "2", "ACPOWER": "Yes", "WIFI": "Yes", "COOKIES": 0],
["Company": "Cyber Youth Tech (CyTech)", "Name": "Charissa Kim", "Phone": "909-247-8988", "NTABLES": "2", "ACPOWER": "No", "WIFI": "Yes", "COOKIES": 0],
["Company": "All Girls Math Tournament", "Name": "Sabreen Alam", "Phone": "949-342-0601", "NTABLES": "2", "ACPOWER": "No", "WIFI": "No", "COOKIES": 0],
["Company": "Bionerds", "Name": "Diana Dizon", "Phone": "949-288-1486", "NTABLES": "2", "ACPOWER": "Yes", "WIFI": "No", "COOKIES": 0],
["Company": "Orange County Department of Education", "Name": "Omar Shepherd", "Phone": "714-327-1069", "NTABLES": "2", "ACPOWER": "Yes", "WIFI": "Yes", "COOKIES": 0],
["Company": "Bio-Rad Laboratories", "Name": "Michelle Conard", "Phone": "949-598-1221", "NTABLES": "2", "ACPOWER": "No", "WIFI": "No", "COOKIES": 0],
["Company": "Michael Baker International", "Name": "Anisha Malik", "Phone": "949-855-3674", "NTABLES": "2", "ACPOWER": "No", "WIFI": "No", "COOKIES": 0],
["Company": "Science Scoop", "Name": "Lexie Howell", "Phone": "949-698-2373", "NTABLES": "2", "ACPOWER": "No", "WIFI": "No", "COOKIES": 0]]

// Here's how to print the structure above
//for r in jsonData {
//    r.forEach {k, v in
//        print ("key: \(k) value: \(v)")
//    }
//    print ("--------------------------------------")
//}
