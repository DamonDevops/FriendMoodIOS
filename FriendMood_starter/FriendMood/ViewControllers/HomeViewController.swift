//
//  HomeViewController.swift
//  FriendMood
//
//  Created by Joris Thiery on 20/02/2018.
//  Copyright © 2018 Joris Thiery. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var profileBackground: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var profilImageView: UIImageView!
    @IBOutlet weak var profilLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    
    var messages = [Message]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        profileBackground.image = UIImage(named: "bg_home")
        profilImageView.layer.cornerRadius = profilImageView.frame.size.height/2
        profilImageView.image = UIImage(named: "duck")
        profilImageView.backgroundColor = .systemGray5
        profilImageView.layer.borderWidth = 3
        profilImageView.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        profilLabel.font = UIFont.openSansBold(size: 14)
        profilLabel.textColor = .white
        
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
            moodController.modalPresentationStyle = .fullScreen
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
