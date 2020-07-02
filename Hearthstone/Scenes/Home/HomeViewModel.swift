//
//  HomeViewModel.swift
//  Hearthstone
//
//  Created by Edwy Lugo on 29/06/20.
//  Copyright © 2020 Edwy Lugo. All rights reserved.
//

import Foundation

protocol HomeNavigationProtocol: AnyObject {
    func gotoInfoDetail(info: Info)
}

protocol HomeViewModelProtocol {
    var dataSource: Observable<Info?> { get }
    var error: Observable<Error?> { get }
    func setDataSource()
  //  func didSelectItemAt(indexPath: IndexPath)
}

struct HomeViewModel: HomeViewModelProtocol {
    private weak var navigationDelegate: HomeNavigationProtocol?
    var dataSource: Observable<Info?>
    var error: Observable<Error?>
    
    init(navigationDelegate: HomeNavigationProtocol? = nil) {
        self.navigationDelegate = navigationDelegate
        self.error = Observable(nil)
        self.dataSource = Observable(nil)
        setDataSource()
    }
    func setDataSource() {
        
        HearthstoreREST.loadInfo(onComplete: { infos in
            self.dataSource.value = infos.self
        }) { error in
            DispatchQueue.main.async {
                print(error)
                switch error {
                case .url:
                    print("Não foi possível carregar a URL")
                case let .taskerror(error):
                    CommonToUI.sharedInstance.showAlert("IPM Informa:", "Para visualizar os Livros é necessário estar conectado com a internet.", nil)
                    print("\(error)")
                case let .noResponse(error):
                    CommonToUI.sharedInstance.showAlert(error.localizedDescription, "Serviço fora do ar. Entre em contato com a equipe técnica para visualizar as notas encerradas.", nil)
                case .noData:
                    print("Não foi possível carregar os dados para visualizar os Livros.")
                case let .responseStatusCode(code):
                    CommonToUI.sharedInstance.showAlert("IPM Informa:", "Verificamos que o servidor está fora do ar (Status: \(code).", nil)
                case let .invalidJSON(error):
                    CommonToUI.sharedInstance.showAlert(error.localizedDescription, "Uma nova estrutura foi criada pela equipe de desenvolvedores. Entre em contato com a equipe técnica.", nil)
                }
            }
        }
        
    }
    
//    func didSelectItemAt(indexPath: IndexPath) {
//          guard dataSource.value.indices.contains(indexPath.row) else { return }
//          let item = dataSource.value[indexPath.row]
//          navigationDelegate?.gotoInfoDetail(info: item)
//      }
}

