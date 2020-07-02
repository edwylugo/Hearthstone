//
//  CubesCollectionViewCell.swift
//  Hearthstone
//
//  Created by Edwy Lugo on 01/07/20.
//  Copyright © 2020 Edwy Lugo. All rights reserved.
//

import UIKit

class CubesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var cubeView: UIView! {
        didSet {
            cubeView.backgroundColor = UIColor.random()
            cubeView.layer.cornerRadius = 16
            cubeView.layer.shadowColor = UIColor.black.cgColor
            cubeView.layer.shadowOpacity = 0.1
            cubeView.layer.shadowOffset = CGSize.zero
            cubeView.layer.shadowRadius = 1
        }
    }
    @IBOutlet var lbTitle: UILabel!
    
    class var reuseIdentifier: String {
        return "CubesCollectionViewCell"
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
