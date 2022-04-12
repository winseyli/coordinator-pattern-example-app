//
//  MainCoordinator.swift
//  coordinator-pattern-example-app
//
//  Created by Winsey Li on 12/04/22.
//

import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = MainViewController()
        navigationController.pushViewController(vc, animated: false)
    }
}
