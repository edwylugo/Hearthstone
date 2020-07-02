//
//  ItemTableViewCell.swift
//  Hearthstone
//
//  Created by Edwy Lugo on 01/07/20.
//  Copyright © 2020 Edwy Lugo. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    
    @IBOutlet var collectionView: UICollectionView!
    
    class var reuseIdentifier: String {
        return "ItemTableViewCell"
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(UINib.init(nibName: "CubesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CubesCollectionViewCell")

    }
    
}

extension ItemTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CubesCollectionViewCell.reuseIdentifier, for: indexPath)
        
        return cell
    }
 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 144, height: 108)
    }
    
}
