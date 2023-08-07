//
//  HomeViewController.swift
//  FriendMood
//
//  Created by Joris Thiery on 20/02/2018.
//  Copyright © 2018 Joris Thiery. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var profilImageView: UIImageView!
    @IBOutlet weak var profilLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    
    var messages = [Message]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        UIFont.familyNames.forEach({ familyName in
                   let fontNames = UIFont.fontNames(forFamilyName: familyName)
                   print(familyName, fontNames)
               })
        
        self.refreshMessages()
    }
    
    func refreshMessages() {
        //GET MESSAGES DATA & REFRESH TABLEVIEW
        NetworkServices.messages { (messages, statusCode, error) in
            if let finalError = error {
                print("error networking : \(finalError)")
                //MANAGE ERROR
            } else {
                self.messages = messages
                self.tableView.reloadData()
            }
        }
    }
    
    @IBAction func addAction(_ sender: UIButton) {
    
        if let moodController = self.storyboard?.instantiateViewController(withIdentifier: "MoodSetterViewController") as? MoodSetterViewController {
            self.present(moodController, animated: true, completion: nil)
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: MessageTableViewCell.reuseCellIdentifier, for: indexPath) as? MessageTableViewCell else { return UITableViewCell() }
        
        cell.setupCell(message: self.messages[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
