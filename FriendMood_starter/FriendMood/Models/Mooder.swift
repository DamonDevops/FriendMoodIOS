//
//  Mooder.swift
//  FriendMood
//
//  Created by Joris Thiery on 20/02/2018.
//  Copyright © 2018 Joris Thiery. All rights reserved.
//

import UIKit
import SwiftyJSON

class Mooder {

    var id: String!
    var lastName: String!
    var firstName: String!
    var avatarUrl: String!
    var friendList: [String]!

    init(json: JSON) {
        
        //ID
        self.id = json["id"].stringValue
        
        //FIRSTNAME
        self.firstName = json["firstName"].stringValue
        
        //LASTNAME
        self.lastName = json["lastName"].stringValue
        
        //AVATARURL
        self.avatarUrl = json["avatarUrl"].stringValue
        
        //FRIENDS LIST ID
        self.friendList = [String]()
        for friendId in json["friendList"].arrayValue {
            self.friendList.append(friendId.stringValue)
        }
    }
}
