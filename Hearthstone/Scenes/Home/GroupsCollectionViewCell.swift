//
//  GroupsCollectionViewCell.swift
//  Hearthstone
//
//  Created by Edwy Lugo on 02/07/20.
//  Copyright © 2020 Edwy Lugo. All rights reserved.
//

import UIKit

class GroupsCollectionViewCell: UICollectionViewCell {
    @IBOutlet var cubeView: UIView! {
        didSet {
            cubeView.frame =  CGRect(x:0, y: 0, width:144, height:108)
            cubeView.backgroundColor = UIColor.random()
            cubeView.layer.cornerRadius = 16
            cubeView.layer.shadowColor = UIColor.black.cgColor
            cubeView.layer.shadowOpacity = 0.1
            cubeView.layer.shadowOffset = CGSize.zero
            cubeView.layer.shadowRadius = 1
        }
    }
    
    @IBOutlet var lbName: UILabel!
    
    
    class var reuseIdentifier: String {
            return "GroupsCollectionViewCell"
    }

    override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
    }
    
}
