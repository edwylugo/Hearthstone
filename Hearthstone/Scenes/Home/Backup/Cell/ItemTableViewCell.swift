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
    
    var classes: [String?] = []
    var types: [String?] = []
    var races: [String?] = []
    var index: [Int] = [2]
    
    class var reuseIdentifier: String {
        return "ItemTableViewCell"
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(UINib.init(nibName: "CubesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CubesCollectionViewCell")
        self.collectionView.reloadData()

    }
    
    func setup(viewModel: Info) {
        print("viewModel: \(viewModel)")
        classes = viewModel.classes
        races = viewModel.races
        types = viewModel.types
        print("index: \(index)")
        self.collectionView.reloadData()
    }
    
    
}

extension ItemTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        for ind in index {
            
            if ind == 0 {
                return classes.count
            }
            
            if ind == 1 {
                return types.count
            }
            
            if ind == 2 {
                return races.count
            }
            
        }
        
        return 0
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CubesCollectionViewCell.reuseIdentifier, for: indexPath) as! CubesCollectionViewCell
        
        for ind in index {
            if ind == 0 {
                cell.lbTitle.text = "\(classes[indexPath.row]?.description ?? "")"
            }
            
            if ind == 1 {
                cell.lbTitle.text = "\(types[indexPath.row]?.description ?? "")"
            }
            
            if ind == 2 {
                cell.lbTitle.text = "\(races[indexPath.row]?.description ?? "")"
            } 
        }
        
        
        
        return cell
    }
 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 144, height: 108)
    }
    
}
