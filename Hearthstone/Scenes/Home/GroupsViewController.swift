//
//  GroupsViewController.swift
//  Hearthstone
//
//  Created by Edwy Lugo on 02/07/20.
//  Copyright © 2020 Edwy Lugo. All rights reserved.
//

import UIKit

class GroupsViewController: UIViewController {
    
    var infos: [Info] = []
    @IBOutlet var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
          self.navigationItem.setHidesBackButton(true, animated: true)
          self.navigationController?.isNavigationBarHidden = false
          self.navigationController?.navigationBar.barTintColor = UIColor(named: "background")
          self.navigationController?.navigationBar.backgroundColor =  UIColor(named: "background")
          self.title = "Hearthstoner"
    
        HearthstoreREST.loadInfo(onComplete: { (infos) in
            DispatchQueue.main.async {
                
                self.infos = [infos]
                self.tableView.reloadData()
                print("infos: \(infos)" )
                print("infos classes count: \(infos.classes.count)" )
                print("infos types count: \(infos.types.count)" )
                print("infos races count: \(infos.races.count)" )
                
                let cells = self.tableView?.visibleCells as! [GroupsTableViewCell]

                for cell in cells {
                    cell.collectionView.reloadData()
                }
                
            }
            
        }) { error in
            DispatchQueue.main.async {
                print(error)
                switch error {
                case .url:
                    print("Não foi possível carregar a URL")
                case let .taskerror(error):
                    CommonToUI.sharedInstance.showAlert("Hearthstone:", "Para visualizar os jogos é necessário estar conectado com a internet.", nil)
                    print("\(error)")
                case let .noResponse(error):
                    CommonToUI.sharedInstance.showAlert(error.localizedDescription, "Serviço fora do ar. Entre em contato com a equipe técnica para visualizar as notas encerradas.", nil)
                case .noData:
                    print("Não foi possível carregar os dados para visualizar os jogos.")
                case let .responseStatusCode(code):
                    CommonToUI.sharedInstance.showAlert("Hearthstone:", "Verificamos que o servidor está fora do ar (Status: \(code).", nil)
                case let .invalidJSON(error):
                    CommonToUI.sharedInstance.showAlert(error.localizedDescription, "Uma nova estrutura foi criada pela equipe de desenvolvedores. Entre em contato com a equipe técnica.", nil)
                }
            }
        }
}
    
   
      
    override var prefersStatusBarHidden: Bool {
            return true
    }
    


}
extension GroupsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in _: UITableView) -> Int {
          return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GroupsTableViewCell", for: indexPath) as? GroupsTableViewCell else {
            fatalError("Unable to create explore table view cell")
        }
        
        switch indexPath.row {
            case 0:
                cell.lbTitleGroup.text = "Classes"
            case 1:
                cell.lbTitleGroup.text = "Types"
            case 2:
                cell.lbTitleGroup.text = "Races"
            
        default:
            cell.lbTitleGroup.text = ""
        }
        
        cell.collectionView.delegate = self
        cell.collectionView.dataSource = self
        cell.collectionView.tag = indexPath.row
        cell.collectionView.reloadData()
    
        return cell
    }

}

extension GroupsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        var classes: Int = 0
        var types: Int = 0
        var races: Int = 0

        for info in infos {
            classes = info.classes.count
            types = info.types.count
            races = info.races.count
            print("classes count: \(classes)" )
            print("types count: \(types)" )
            print("races count: \(races)" )
        }

        if collectionView.tag == 0 {
            return classes
        }
        
        if collectionView.tag == 1 {
            return types
        }
        
        if collectionView.tag == 2 {
            return races
        }
      
        return 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GroupsCollectionViewCell", for: indexPath) as! GroupsCollectionViewCell
        
        for info in infos {
            if collectionView.tag == 0 {
                cell.cubeView.backgroundColor = .random()
                cell.lbName.text = "\(info.classes[indexPath.row])"
            }
            
            if collectionView.tag == 1 {
               cell.cubeView.backgroundColor = .random()
               cell.lbName.text = "\(info.types[indexPath.row])"
            }
            
            if collectionView.tag == 2 {
               cell.cubeView.backgroundColor = .random()
               cell.lbName.text = "\(info.races[indexPath.row])"
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           return CGSize(width: 180, height: 108)
       }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vc: DetailsViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        
        for info in infos {
            if collectionView.tag == 0 {
                print("Item: \(info.classes[indexPath.row])")
                vc.itemGroup = "\(info.classes[indexPath.row])"
                vc.nameGroup = "Classes"
            }

            if collectionView.tag == 1 {
            print("Item: \(info.types[indexPath.row])")
                vc.itemGroup = "\(info.types[indexPath.row])"
                vc.nameGroup = "Types"
            }

            if collectionView.tag == 2 {
            print("Item: \(info.races[indexPath.row])")
                vc.itemGroup = "\(info.races[indexPath.row])"
                vc.nameGroup = "Races"
            }
        }
        self.navigationController?.pushViewController(vc, animated: true)

    }
    
    
    
    
}

