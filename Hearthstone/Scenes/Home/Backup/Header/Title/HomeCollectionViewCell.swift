//
//  HomeCollectionViewCell.swift
//  Hearthstone
//
//  Created by Edwy Lugo on 01/07/20.
//  Copyright © 2020 Edwy Lugo. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell , UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    private let cellId = "appCellId"
    
    var classesInfo: [String] = []
    var typesInfo: [String] = []
    var racesInfo: [String] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    let appsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.backgroundColor = UIColor(named: "background")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
        
    func setupViews() {
        backgroundColor = UIColor.clear
        
        addSubview(appsCollectionView)
        appsCollectionView.dataSource = self
        appsCollectionView.delegate = self
        
        appsCollectionView.register(AppCell.self, forCellWithReuseIdentifier: cellId)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": appsCollectionView]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": appsCollectionView]))
        
    }
    
    func setup(classes: [String], types: [String], races: [String]) {
        print(classes.count)
        print(types.count)
        print(races.count)
        
        classesInfo = classes
        typesInfo = types
        racesInfo = races
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppCell
        
        switch indexPath.row {
        case 0:
            cell.nameLabel.text = "edwy"
        default:
            cell.nameLabel.text = "lugo"
        }
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 144, height: frame.height - 32)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
    }
    
}

class AppCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "banner")
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 16
        iv.layer.masksToBounds = true
        return iv
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 23, y: 17, width: 144, height: 104))
        label.textAlignment = .left
        label.text = "Hunter"
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.textColor = .white
        label.font = UIFont(name: "AvenirLTStd-Medium", size: 18)
        return label
    }()
    
    var cellView: UIView = {
        
            let view = UIView(frame: CGRect(x: 0, y: 0, width: 144, height: 104))
            view.layer.cornerRadius = 16
            view.backgroundColor = UIColor.random()
            view.layer.shadowColor = UIColor.black.cgColor
            view.layer.shadowOpacity = 0.1
            view.layer.shadowOffset = CGSize.zero
            view.layer.shadowRadius = 1
            return view
    }()
    
    func setupViews() {
        
        addSubview(cellView)
        self.cellView.addSubview(nameLabel)
        self.self.addSubview(cellView)
        
        
    }
    
}
