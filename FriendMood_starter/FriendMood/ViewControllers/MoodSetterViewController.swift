//
//  MoodSetterViewController.swift
//  FriendMood
//
//  Created by Joris Thiery on 20/02/2018.
//  Copyright © 2018 Joris Thiery. All rights reserved.
//

import UIKit

class MoodSetterViewController: UIViewController {

    @IBOutlet weak var centerView: UIView!
    @IBOutlet weak var sendLabel: UILabel!
    @IBOutlet weak var textFieldContainer: UIStackView!
    @IBOutlet weak var chooseYourMoodLabel: UILabel!
    @IBOutlet weak var moodTextField: UITextField!
    @IBOutlet weak var sendMoodButton: UIButton!
    @IBOutlet weak var profilImageView: UIImageView!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var smileysCollectionView: UICollectionView!
    
    var smileys = [UIImage(named: "ico_emo_profil"), UIImage(named: "ico_emo_1"), UIImage(named: "ico_emo_2"), UIImage(named: "ico_emo_3"), UIImage(named: "ico_emo_4"), UIImage(named: "ico_emo_5"), UIImage(named: "ico_emo_6"), UIImage(named: "ico_emo_7"), UIImage(named: "ico_emo_8"), UIImage(named: "ico_emo_9"), UIImage(named: "ico_emo_10"), UIImage(named: "ico_emo_11")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.moodTextField.becomeFirstResponder()
        
        self.moodTextField.placeholder = "Je suis en mode <3 today"
        self.moodTextField.font = UIFont.robotoRegular(size: 13)
        self.moodTextField.textColor = UIColor.placeholderFont()
        self.moodTextField.borderStyle = .none
        
        self.chooseYourMoodLabel.text = "Quelle est votre humeur du jour ?"
        self.chooseYourMoodLabel.font = UIFont.openSansSemiBold(size: 15)
        self.chooseYourMoodLabel.textColor = UIColor.darkGreyFont()
        
        self.smileysCollectionView.delegate = self
        self.smileysCollectionView.dataSource = self
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: self.smileysCollectionView.frame.size.width/6, height: self.smileysCollectionView.frame.size.height/2)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        self.smileysCollectionView.collectionViewLayout = layout
        
        profilImageView.layer.cornerRadius = profilImageView.frame.size.height/2
        profilImageView.image = UIImage(named: "duck")
        profilImageView.backgroundColor = .systemGray5
        profilImageView.layer.borderWidth = 3
        profilImageView.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        
        centerView.layer.cornerRadius = 5
        centerView.layer.masksToBounds = true
        
        textFieldContainer.layer.borderWidth = 1
        textFieldContainer.layer.borderColor = .init(gray: 0.8, alpha: 1)
        textFieldContainer.layer.cornerRadius = textFieldContainer.frame.size.height/2
        
        sendMoodButton.titleLabel?.font = UIFont.robotoBold(size: 9)
        sendMoodButton.titleLabel?.textColor = UIColor.lightGreyFont()

    }
    
    @IBAction func closeAction(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func sendMoodAction(_ sender: UIButton) {
    
    }
}

extension MoodSetterViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.smileys.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let smileyCell = self.smileysCollectionView.dequeueReusableCell(withReuseIdentifier: SmileyCollectionViewCell.reuseIdentifier, for: indexPath) as? SmileyCollectionViewCell {
            
            smileyCell.setupCell(smileyImage: self.smileys[indexPath.row]!)
            
            return smileyCell
        } else {
            return UICollectionViewCell()
        }
    }
    
}
