//
//  NetworkServices.swift
//  FriendMood
//
//  Created by Joris Thiery on 20/02/2018.
//  Copyright © 2018 Joris Thiery. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class NetworkServices {

    typealias moodersCompletionHandler = (_ mooders: [Mooder], _ statusCode: Int?, _ error: Error?) -> ()
    typealias messagesCompletionHandler = (_ messages: [Message], _ statusCode: Int?, _ error: Error?) -> ()
    
    static func mooders(completionHandler: @escaping moodersCompletionHandler) {
        
        AF.request(EndPoints.mooders.rawValue).responseJSON { (dataResponse) in
            
            if let error = dataResponse.error {
                completionHandler([], dataResponse.response?.statusCode, error)
                return
            }
            
            if let data = dataResponse.data {
                let json = JSON(data)
                var mooders = [Mooder]()
                for mooder in json["mooders"].arrayValue {
                    mooders.append(Mooder(json: mooder))
                }
                completionHandler(mooders, nil, nil)
            } else {
                completionHandler([], 404, nil) //return 404 status code if no data in JSON payload
            }
        }
    }
    
    static func messages(completionHandler: @escaping messagesCompletionHandler) {
        
        AF.request(EndPoints.messages.rawValue).responseJSON { (dataResponse) in
            
            if let error = dataResponse.error {
                completionHandler([], dataResponse.response?.statusCode, error)
                return
            }
            
            if let data = dataResponse.data {
                let json = JSON(data)
                var messages = [Message]()
                for message in json["messages"].arrayValue {
                    messages.append(Message(json: message))
                }
                completionHandler(messages, nil, nil)
            } else {
                completionHandler([], 404, nil) //return 404 status code if no data in JSON payload
            }
        }
    }
}
