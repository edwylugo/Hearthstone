//
//  SectionHeader.swift
//  Hearthstone
//
//  Created by Edwy Lugo on 01/07/20.
//  Copyright © 2020 Edwy Lugo. All rights reserved.
//

import Foundation
import UIKit

class SectionHeader: UICollectionReusableView {
     var label: UILabel = {
     let label: UILabel = UILabel()
     label.textColor = UIColor(named: "grayTitle")
     label.font = UIFont(name: "AvenirLTStd-Medium", size: 16)
     label.sizeToFit()
     return label
 }()
    

override init(frame: CGRect) {
     super.init(frame: frame)
     setupViews()
}

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupViews() {
        backgroundColor = UIColor.clear
        addSubview(label)

        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: self.topAnchor).isActive = false
        label.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        label.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
    }
}

