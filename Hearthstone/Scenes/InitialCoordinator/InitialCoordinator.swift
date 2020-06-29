//
//  InitialCoordinator.swift
//  Hearthstone
//
//  Created by Edwy Lugo on 29/06/20.
//  Copyright © 2020 Edwy Lugo. All rights reserved.
//

import UIKit

final class InitialCoordinator: Coordinator {
   var childCoordinators: [Coordinator] = []
   private let presenter: UINavigationController

   init(presenter: UINavigationController) {
       self.presenter = presenter
   }

   func start() {
       let viewModel = HomeViewModel(navigationDelegate: self)
       let viewController = HomeViewController(viewModel: viewModel)
       presenter.pushViewController(viewController, animated: true)
   }
}

extension InitialCoordinator: HomeNavigationProtocol {
    func gotoInfoDetail(info: Info) {}
}



