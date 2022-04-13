//
//  Coordinator.swift
//  coordinator-pattern-example-app
//
//  Created by Winsey Li on 12/04/22.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}
