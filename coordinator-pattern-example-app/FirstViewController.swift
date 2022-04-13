//
//  FirstViewController.swift
//  coordinator-pattern-example-app
//
//  Created by Winsey Li on 13/04/22.
//

import UIKit

class FirstViewController: UIViewController {
    
    weak var coordinator: FirstChildCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        let label = UILabel()
        label.text = "First View Controller"
        label.textAlignment = .center
        
        let stackView = UIStackView()
        stackView.axis = NSLayoutConstraint.Axis.vertical
        stackView.distribution = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing = 16.0

        stackView.addArrangedSubview(label)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        self.view.addSubview(stackView)

        //Constraints
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        coordinator?.didFinish()
    }
}
