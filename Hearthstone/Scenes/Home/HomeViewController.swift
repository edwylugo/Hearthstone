//
//  HomeViewController.swift
//  Hearthstone
//
//  Created by Edwy Lugo on 01/07/20.
//  Copyright © 2020 Edwy Lugo. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private var viewModel: HomeViewModelProtocol
    
    init(viewModel: HomeViewModelProtocol) {
           self.viewModel = viewModel
           super.init(nibName: "HomeViewController", bundle: nil)
    }

    required init?(coder _: NSCoder) {
           fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Hearthstone"
        setupUI()
        setupBindings()
    }
    
    func setupBindings() {
           viewModel.dataSource.bind { [weak self] _ in
            guard self != nil else { return }
               DispatchQueue.main.async {
                print("classes: \(self!.viewModel.dataSource.value?.classes ?? [])")
                print("types: \(self!.viewModel.dataSource.value?.types ?? [])")
                print("races: \(self!.viewModel.dataSource.value?.races ?? [])")
                self?.tableView.reloadData()
               }
           }
    }
    
    func setupUI() {
        // Retorna a célula da interface
        let nib = UINib(nibName: "ItemTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: ItemTableViewCell.reuseIdentifier)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.barTintColor = UIColor(named: "background")
        self.navigationController?.navigationBar.backgroundColor =  UIColor(named: "background")

        
    }
    override var prefersStatusBarHidden: Bool {
          return true
      }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in _: UITableView) -> Int {
          return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_: UITableView, titleForHeaderInSection section: Int) -> String? {
           switch section {
               case 0:
               return "Classes"
               case 1:
               return "Types"
               case 2:
               return "Races"
               default:
               return ""
           }
       }
    
    func tableView(_: UITableView, willDisplayHeaderView view: UIView, forSection _: Int) {
        view.tintColor = UIColor(named: "background")
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        header.textLabel!.textColor = UIColor(named: "grayTitle")
        header.textLabel!.font = UIFont.systemFont(ofSize: 22)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemTableViewCell", for: indexPath) as? ItemTableViewCell else {
                fatalError("Unable to create explore table view cell")
            }
        
            return cell
        }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
}






