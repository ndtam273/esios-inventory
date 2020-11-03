//
//  ProductViewController.swift
//  es-inventory
//
//  Created by TAM NGUYEN DUC on 10/29/20.
//  Copyright © 2020 TAM NGUYEN DUC. All rights reserved.
//

import UIKit

class ProductViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "ProductCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "productCell")
        tableView.delegate = self
        tableView.dataSource = self
        setupUI()
        // Do any additional setup after loading the view.
    }

    override func setupUI() {
        super.setupUI()
        title = App.Text.titleHome
    }
    
    @IBAction func didAddProduct(_ sender: UIButton) {
        let cameraVC = ViewController()
        navigationController?.pushViewController(cameraVC, animated: false)
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
