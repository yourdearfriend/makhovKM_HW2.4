//
//  ViewControllerHome.swift
//  myfirstapp
//
//  Created by Konstantin on 30.08.2020.
//  Copyright © 2020 Konstantin. All rights reserved.
//

import UIKit

class ViewControllerHome: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    
    var nameLabel: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome \(nameLabel!)!"
    }
}
