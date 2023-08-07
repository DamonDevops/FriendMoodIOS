//
//  FriendsViewController.swift
//  FriendMood
//
//  Created by Joris Thiery on 20/02/2018.
//  Copyright © 2018 Joris Thiery. All rights reserved.
//

import UIKit

class FriendsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var profilImageView: UIImageView!
    @IBOutlet weak var profilLabel: UILabel!
    
    var mooders = [Mooder]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.refreshMooders()
        
        profilImageView.layer.cornerRadius = profilImageView.frame.size.height/2
        profilImageView.image = UIImage(named: "duck")
        profilImageView.backgroundColor = .systemGray5
        profilImageView.layer.borderWidth = 3
        profilImageView.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        
        profilLabel.font = UIFont.openSansBold(size: 14)
        profilLabel.textColor = .white
    }
    
    func refreshMooders() {
        //GET mooders DATA & REFRESH TABLEVIEW
        NetworkServices.mooders { (mooders, statusCode, error) in
            if let finalError = error {
                print("error networking : \(finalError)")
                //MANAGE ERROR
            } else {
                self.mooders = mooders
                self.tableView.reloadData()
            }
        }
    }

}

extension FriendsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.mooders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: FriendTableViewCell.reuseCellIdentifier, for: indexPath) as? FriendTableViewCell else { return UITableViewCell() }

        cell.setupCell(mooder: self.mooders[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
    
}
