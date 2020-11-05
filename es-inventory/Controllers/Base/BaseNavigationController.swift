//
//  BaseNavigationController.swift
//  es-inventory
//
//  Created by TAM NGUYEN DUC on 10/28/20.
//  Copyright © 2020 TAM NGUYEN DUC. All rights reserved.
//
import UIKit
 
class BaseNavigationController: UINavigationController {
 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.tabBarController?.tabBar.isHidden = true
 
        // Do any additional setup after loading the view.
    }
}
