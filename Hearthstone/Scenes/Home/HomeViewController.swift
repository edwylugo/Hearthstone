//
//  HomeViewController.swift
//  Hearthstone
//
//  Created by Edwy Lugo on 29/06/20.
//  Copyright © 2020 Edwy Lugo. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var viewModel: HomeViewModelProtocol
    
    init(viewModel: HomeViewModelProtocol) {
           self.viewModel = viewModel
           super.init(nibName: "HomeViewController", bundle: nil)
    }

    required init?(coder _: NSCoder) {
           fatalError("init(coder:) has not been implemented")
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Hearthstone"
    }
    
    override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    
}
