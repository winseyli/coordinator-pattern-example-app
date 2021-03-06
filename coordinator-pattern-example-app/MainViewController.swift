//
//  MainViewController.swift
//  coordinator-pattern-example-app
//
//  Created by Winsey Li on 12/04/22.
//

import UIKit

class MainViewController: UIViewController {
    
    weak var coordinator: MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        let button1 = UIButton()
        button1.setTitle("Test Button 1", for: .normal)
        button1.backgroundColor = .gray
        button1.setTitleColor(UIColor.white, for: .normal)
        button1.widthAnchor.constraint(equalToConstant: 120.0).isActive = true
        button1.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        button1.addTarget(self, action: #selector(self.button1Tapped), for: .touchUpInside)
        
        let stackView = UIStackView()
        stackView.axis = NSLayoutConstraint.Axis.vertical
        stackView.distribution = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing = 16.0

        stackView.addArrangedSubview(button1)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        self.view.addSubview(stackView)

        //Constraints
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    
    @objc func button1Tapped(sender: UIButton) {
        //Write button action here
        coordinator?.showFirstVC()
    }
}
