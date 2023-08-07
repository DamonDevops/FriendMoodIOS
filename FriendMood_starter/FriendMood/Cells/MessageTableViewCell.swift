//
//  MessageTableViewCell.swift
//  FriendMood
//
//  Created by Joris Thiery on 20/02/2018.
//  Copyright © 2018 Joris Thiery. All rights reserved.
//

import UIKit
import AlamofireImage

class MessageTableViewCell: UITableViewCell {

    static let reuseCellIdentifier = "MessageTableViewCell"
    
    @IBOutlet weak var messageContainerView: UIView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var avatarEmojiImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var messageTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        messageContainerView.layer.cornerRadius = 5
        messageContainerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        messageContainerView.layer.cornerRadius = 5
        messageContainerView.layer.masksToBounds = false
        messageContainerView.layer.shadowColor = UIColor.systemGray5.cgColor
        messageContainerView.layer.shadowOpacity = 1
        messageContainerView.layer.shadowRadius = 1
        messageContainerView.layer.shadowOffset = CGSize(width: -1, height: 1)
        
        avatarImageView.layer.cornerRadius = avatarImageView.frame.size.height/2
        nameLabel.font = UIFont.openSansSemiBold(size: 14)
        nameLabel.textColor = UIColor.darkGreyFont()
        messageTextLabel.font = UIFont.openSansLight(size: 14)
        messageTextLabel.textColor = UIColor.lightGreyFont()
        
        hourLabel.font = UIFont.openSansBold(size: 14)
        hourLabel.textColor = UIColor.darkGreyFont()
        dayLabel.font = UIFont.openSansRegular(size: 11)
        dayLabel.textColor = UIColor.darkGreyFont()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(message: Message) {
        
        self.nameLabel.text = message.mooderName
        
        let dateFormatterHour = DateFormatter()
        dateFormatterHour.dateFormat = "HH:MM"
        
        let dateFormatterDay = DateFormatter()
        dateFormatterDay.dateFormat = "EEE"
        
        self.hourLabel.text = dateFormatterHour.string(from: message.date)
        self.dayLabel.text = dateFormatterDay.string(from: message.date)
        self.messageTextLabel.text = message.text
        
        self.avatarImageView.contentMode = .scaleAspectFit
        self.avatarImageView.af.setImage(withURL: URL(string: message.mooderAvatarUrl)!)
        
        self.avatarEmojiImageView.image = UIImage(named: message.mooderStatus.rawValue)
        
        contentView.backgroundColor = .systemGray6.withAlphaComponent(0.3)
    }
}
