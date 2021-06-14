//
//  MoodSetterViewController.swift
//  FriendMood
//
//  Created by Joris Thiery on 20/02/2018.
//  Copyright © 2018 Joris Thiery. All rights reserved.
//

import UIKit

class MoodSetterViewController: UIViewController {

    @IBOutlet weak var chooseYourMoodLabel: UILabel!
    @IBOutlet weak var moodTextField: UITextField!
    @IBOutlet weak var sendMoodButton: UIButton!
    @IBOutlet weak var profilImageView: UIImageView!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var smileysCollectionView: UICollectionView!
    
    var smileys = [UIImage(named: "first"), UIImage(named: "second"), UIImage(named: "first"), UIImage(named: "second"), UIImage(named: "first"), UIImage(named: "second"), UIImage(named: "first"), UIImage(named: "second"), UIImage(named: "first"), UIImage(named: "second"), UIImage(named: "first"), UIImage(named: "second")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.moodTextField.becomeFirstResponder()
        
        self.chooseYourMoodLabel.text = "Quelle est votre humeur du jour ?"
        
        self.smileysCollectionView.delegate = self
        self.smileysCollectionView.dataSource = self
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: self.smileysCollectionView.frame.size.width/6, height: self.smileysCollectionView.frame.size.height/2)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        self.smileysCollectionView.collectionViewLayout = layout

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
