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
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var messageTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
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
    }
}
