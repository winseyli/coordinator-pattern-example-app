//
//  MainCoordinator.swift
//  coordinator-pattern-example-app
//
//  Created by Winsey Li on 12/04/22.
//

import UIKit

class MainCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = MainViewController()
        vc.coordinator = self
        navigationController.delegate = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func addChildCoordinator(_ child: Coordinator) {
        childCoordinators.append(child)
        print("addChildCoordinator")
    }
    
    func removeChildCoordinator(_ child: Coordinator) {
        childCoordinators = self.childCoordinators.filter { $0 !== child }
        print("removeChildCoordinator")
    }
    
    func showFirstVC() {
        let child = FirstChildCoordinator(navigationController: navigationController)
        child.parentCoordinator = self
        child.start()
        addChildCoordinator(child)
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        // Read the view controller we’re moving from.
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }

        // Check whether our view controller array already contains that view controller. If it does it means we’re pushing a different view controller on top rather than popping it, so exit.
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }

        // We’re still here – it means we’re popping the view controller, so we can check whether to end a child coordinator
        if let firstVC = fromViewController as? FirstViewController, let child = firstVC.coordinator {
            removeChildCoordinator(child)
        }
    }
}
