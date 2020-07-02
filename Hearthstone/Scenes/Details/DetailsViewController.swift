//
//  DetailsViewController.swift
//  Hearthstone
//
//  Created by Edwy Lugo on 29/06/20.
//  Copyright © 2020 Edwy Lugo. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var cards: [Card] = []
    var nameGroup = ""
    var itemGroup = ""
    
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBOutlet var lbGroup: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbGroup.text = nameGroup
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.navigationBar.barTintColor = UIColor(named: "background")
        self.navigationController?.navigationBar.backgroundColor =  UIColor(named: "background")
        
        HearthstoreREST.loadCard(onComplete: { (cards) in
                          DispatchQueue.main.async {
                              self.cards = [cards]
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
