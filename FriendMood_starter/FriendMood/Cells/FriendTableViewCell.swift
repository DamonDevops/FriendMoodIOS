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
        
        mooderContainerView.layer.cornerRadius = 5
        mooderContainerView.layer.masksToBounds = false
        mooderContainerView.layer.shadowColor = UIColor.systemGray5.cgColor
        mooderContainerView.layer.shadowOpacity = 1
        mooderContainerView.layer.shadowRadius = 1
        mooderContainerView.layer.shadowOffset = CGSize(width: -1, height: 1)
        
        avatarImageView.layer.cornerRadius = avatarImageView.frame.size.height/2
        avatarImageView.layer.masksToBounds = true
        
        nameLabel.font = UIFont.openSansSemiBold(size: 14)
        nameLabel.textColor = UIColor.darkGreyFont()
        friendRightLabel.font = UIFont.openSansLight(size: 12)
        friendRightLabel.textColor = UIColor.darkGreyFont()
        friendRightView.backgroundColor = UIColor.systemGray6
        friendRightView.layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(mooder: Mooder) {
        self.avatarImageView.af.setImage(withURL: URL(string: mooder.avatarUrl)!)
        self.nameLabel.text = mooder.firstName + " " + mooder.lastName
        
        self.contentView.backgroundColor = .systemGray6.withAlphaComponent(0.3)
    }

}
