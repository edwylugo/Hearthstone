//
//  DetailsViewController.swift
//  Hearthstone
//
//  Created by Edwy Lugo on 29/06/20.
//  Copyright © 2020 Edwy Lugo. All rights reserved.
//

import UIKit
import Kingfisher

class DetailsViewController: UIViewController {
    
    var cards: [Card] = []
    var nameGroup = ""
    var itemGroup = ""
    var column = ""
    
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var lbGroup: UILabel!
    @IBOutlet var viewLoading: UIView!
    @IBOutlet var lbLoading: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbGroup.text = nameGroup
        self.viewLoading.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.lbLoading.text = "Buscando \(nameGroup)..."
        self.viewLoading.isHidden = false
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.navigationBar.barTintColor = UIColor(named: "background")
        self.navigationController?.navigationBar.backgroundColor =  UIColor(named: "background")
        
        
        let cells = tableView?.visibleCells as! [DetailsTableViewCell]

        
        HearthstoreREST.loadCard(column: "\(column)", value: "\(itemGroup)", onComplete: { (cards) in
                          DispatchQueue.main.async {
                            self.cards = [cards]
                            
                            for cell in cells {
                                cell.collectionView.reloadData()
                            }
                            
                            self.tableView.reloadData()
                            self.viewLoading.isHidden = true
                          }

                      }) { error in
                          DispatchQueue.main.async {
                              print(error)
                              switch error {
                              case .url:
                                self.viewLoading.isHidden = true
                                  print("Não foi possível carregar a URL")
                              case let .taskerror(error):
                                self.viewLoading.isHidden = true
                                  CommonToUI.sharedInstance.showAlert("Hearthstone:", "Para visualizar os jogos é necessário estar conectado com a internet.", nil)
                                  print("\(error)")
                              case let .noResponse(error):
                                self.viewLoading.isHidden = true
                                  CommonToUI.sharedInstance.showAlert(error.localizedDescription, "Serviço fora do ar. Entre em contato com a equipe técnica para visualizar as notas encerradas.", nil)
                              case .noData:
                                self.viewLoading.isHidden = true
                                  print("Não foi possível carregar os dados para visualizar os jogos.")
                              case let .responseStatusCode(code):
                                self.viewLoading.isHidden = true
                                  CommonToUI.sharedInstance.showAlert("Hearthstone:", "Verificamos que o servidor está fora do ar (Status: \(code).", nil)
                              case let .invalidJSON(error):
                                self.viewLoading.isHidden = true
                                  CommonToUI.sharedInstance.showAlert(error.localizedDescription, "Uma nova estrutura foi criada pela equipe de desenvolvedores. Entre em contato com a equipe técnica.", nil)
                              }
                          }
                      }
    }
    
    override var prefersStatusBarHidden: Bool {
               return true
       }
}

extension DetailsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in _: UITableView) -> Int {
          return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 780
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsTableViewCell", for: indexPath) as? DetailsTableViewCell else {
            fatalError("Unable to create explore table view cell")
        }
        
        cell.collectionView.delegate = self
        cell.collectionView.dataSource = self
        cell.collectionView.tag = indexPath.row
        cell.collectionView.reloadData()
        
    
        return cell
    }

}

extension DetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
    var cardss: Int = 0
    for card in cards {
                cardss = card.Basic.count
                   print("card count: \(cardss)" )
               }
    
        if collectionView.tag == 0 {
            return cardss
    }
        return 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailsCollectionViewCell", for: indexPath) as! DetailsCollectionViewCell
    
        for card in cards {
            if collectionView.tag == 0 {
                if let url = URL(string: "\(card.Basic[indexPath.row]?.imgGold?.description ?? "")") {
                   cell.ivCard.kf.setImage(with: url)
                } else {
                    cell.ivCard.image = UIImage(named: "default")
                }
                
            }
        }
       
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           return CGSize(width: 180, height: 108)
       }
    
    
}

