//
//  ViewController.swift
//  Hearthstone
//
//  Created by Edwy Lugo on 29/06/20.
//  Copyright © 2020 Edwy Lugo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func goTabBarApp(_ sender: Any) {
        let coordinator = InitialCoordinator(presenter: self.navigationController!)
        coordinator.start()        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
         self.navigationItem.setHidesBackButton(true, animated: true)
         self.navigationController?.isNavigationBarHidden = true

    }
    
    override var prefersStatusBarHidden: Bool {
         return true
     }
}

extension ViewController: HomeNavigationProtocol {
    func gotoInfoDetail(info: Info) {}
}

