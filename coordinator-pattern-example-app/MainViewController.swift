//
//  MainViewController.swift
//  coordinator-pattern-example-app
//
//  Created by Winsey Li on 12/04/22.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view = UIView(frame: self.view.frame)
        view.backgroundColor = .white
        self.view.addSubview(view)
        
        let label = UILabel(frame: view.frame)
        label.text = "Main View Controller"
        label.center = CGPoint(x: view.frame.width/2, y: view.frame.height/3)
        label.textAlignment = .center
        view.addSubview(label)
    }
}
