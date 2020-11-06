//
//  ProductViewController.swift
//  es-inventory
//
//  Created by TAM NGUYEN DUC on 10/29/20.
//  Copyright © 2020 TAM NGUYEN DUC. All rights reserved.
//

import UIKit

class ProductViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    @IBOutlet weak var botConstraint: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "ProductCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "productCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.keyboardDismissMode = .onDrag
        setupUI()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        if TabbarController.shared.isHideTabbar == true {
            botConstraint.constant = 110
            view.layoutIfNeeded()
        }
        let notificationCenter = NotificationCenter.default
        notificationCenter.post(name: TabbarController.showNotificationName, object: nil)

        
        
        
    }
    override func setupUI() {
        super.setupUI()
        title = App.Text.titleHome
       
    }
    
    @IBAction func didAddProduct(_ sender: UIButton) {
        let cameraVC = CameraViewController()
        let notificationCenter = NotificationCenter.default
        notificationCenter.post(name: TabbarController.hideNotificationName, object: nil)
        self.navigationController?.pushViewController(cameraVC, animated: false)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as! ProductCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}
