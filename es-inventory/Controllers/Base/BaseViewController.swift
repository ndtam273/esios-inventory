//
//  BaseViewController.swift
//  es-inventory
//
//  Created by TAM NGUYEN DUC on 10/28/20.
//  Copyright © 2020 TAM NGUYEN DUC. All rights reserved.
//

import UIKit
 
class BaseViewController: UIViewController {
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
//        setupData()
//        setupUI()
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func setupData() {}
    
    func setupUI() {}
 
}
