//
//  GroupsTableViewCell.swift
//  Hearthstone
//
//  Created by Edwy Lugo on 02/07/20.
//  Copyright © 2020 Edwy Lugo. All rights reserved.
//

import UIKit

class GroupsTableViewCell: UITableViewCell {
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var lbTitleGroup: UILabel!
    
    
    class var reuseIdentifier: String {
           return "GroupsTableViewCell"
       }

       override func awakeFromNib() {
           super.awakeFromNib()
           // Initialization code
       }

}
