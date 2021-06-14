//
//  SmileyCollectionViewCell.swift
//  FriendMood
//
//  Created by Joris Thiery on 20/02/2018.
//  Copyright © 2018 Joris Thiery. All rights reserved.
//

import UIKit

class SmileyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var smileyImageView: UIImageView!
    @IBOutlet weak var heightOfImageViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var widthOfImageViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var circleSelectionView: UIView!
    
    override var isSelected: Bool{
        didSet{
            if self.isSelected
            {
                UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.7, options: .curveEaseInOut, animations: {
                    self.widthOfImageViewConstraint.constant = 34
                    self.heightOfImageViewConstraint.constant = 34
                    self.circleSelectionView.alpha = 0.8
                    self.layoutIfNeeded()
                }, completion: { (_) in
                    //
                })
                
            } else {
                UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.7, options: .curveEaseInOut, animations: {
                    self.widthOfImageViewConstraint.constant = 28
                    self.heightOfImageViewConstraint.constant = 28
                    self.circleSelectionView.alpha = 0
                    self.layoutIfNeeded()
                }, completion: { (_) in
                    //
                })
            }
        }
    }
    
    static let reuseIdentifier = "SmileyCollectionViewCell"
    
    override func awakeFromNib() {
        circleSelectionView.alpha = 0
        circleSelectionView.layer.cornerRadius = circleSelectionView.frame.size.width/2
    }
    
    func setupCell(smileyImage: UIImage) {
        
        self.smileyImageView.image = smileyImage
    }
}
