//
//  FriendTableViewCell.swift
//  FriendMood
//
//  Created by Joris Thiery on 20/02/2018.
//  Copyright © 2018 Joris Thiery. All rights reserved.
//

import UIKit
import AlamofireImage

class FriendTableViewCell: UITableViewCell {

    static let reuseCellIdentifier = "FriendTableViewCell"
    
    @IBOutlet weak var mooderContainerView: UIView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var friendRightView: UIView!
    @IBOutlet weak var friendRightLabel: UILabel!
    @IBOutlet weak var friendRightCheck: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(mooder: Mooder) {
        self.avatarImageView.af.setImage(withURL: URL(string: mooder.avatarUrl)!)
        self.nameLabel.text = mooder.firstName + " " + mooder.lastName
    }

}
