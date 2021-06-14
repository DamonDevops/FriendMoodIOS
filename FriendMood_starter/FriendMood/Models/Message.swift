//
//  Message.swift
//  FriendMood
//
//  Created by Joris Thiery on 20/02/2018.
//  Copyright © 2018 Joris Thiery. All rights reserved.
//

import UIKit
import SwiftyJSON

enum MooderStatus: String {
    case cool = "cool"
    case happy = "happy"
    case grin = "grin"
    case evil = "evil"
    case shocked = "shocked"
    case tongue = "tongue"
}

class Message {

    var id: String!
    var date: Date!
    var mooderName: String!
    var mooderAvatarUrl: String!
    var mooderStatus: MooderStatus!
    var text: String!
    
    init(json: JSON) {

        //ID
        self.id = json["id"].stringValue
        
        //NAME
        self.mooderName = json["mooderName"].stringValue
        
        //AVATAR
        self.mooderAvatarUrl = json["mooderAvatarUrl"].stringValue
        
        //TEXT
        self.text = json["text"].stringValue
        
        //DATE
        let dateString = json["date"].stringValue
        self.date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy hh:mm:ss"
        if let date = dateFormatter.date(from: dateString) {
            self.date = date
        }
        
        //MOODER STATUS
        let statusString = json["mooderStatus"].stringValue

        if statusString == "cool" {
            self.mooderStatus = .cool
        }
        if statusString == "happy" {
            self.mooderStatus = .happy
        }
        if statusString == "grin" {
            self.mooderStatus = .grin
        }
        if statusString == "evil" {
            self.mooderStatus = .evil
        }
        if statusString == "shocked" {
            self.mooderStatus = .shocked
        }
        if statusString == "tongue" {
            self.mooderStatus = .tongue
        }

    }
}
