//
//  OrdersViewController.swift
//  es-inventory
//
//  Created by TAM NGUYEN DUC on 10/29/20.
//  Copyright © 2020 TAM NGUYEN DUC. All rights reserved.
//

import UIKit

class OrdersViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    var strDate = ""
    
    @IBOutlet weak var pickerView: UIDatePicker!
    @IBOutlet weak var alphaView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var dateButtonLabel: UILabel!
    @IBOutlet weak var pickerControlView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "OrderCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "orderCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.keyboardDismissMode = .onDrag
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hidePickerShowTabbar()
    }
    
    override func setupUI() {
        super.setupUI()
        title = App.Text.titleOrders
    }
    
    @IBAction func cancelPicker(_ sender: Any) {
        hidePickerShowTabbar()
    }
    @IBAction func openDatePicker(_ sender: Any) {
        showDatePicker()
    }
    @IBAction func acceptDate(_ sender: Any) {
        let dateFormater = DateFormatter()
        
        dateFormater.dateStyle = DateFormatter.Style.medium
        strDate = dateFormater.string(from: pickerView.date)
        dateButtonLabel.text = strDate
        hidePickerShowTabbar()
        
    }
    
    @IBAction func alphaViewTap(_ sender: Any) {
        hidePickerShowTabbar()
    }
    func showDatePicker() {
        alphaView.isHidden = false
        pickerControlView.isHidden = false
        let notificationCenter = NotificationCenter.default
        notificationCenter.post(name: TabbarController.hideNotificationName, object: nil)
    }
    
    
    func hidePickerShowTabbar() {
        alphaView.isHidden = true
        pickerControlView.isHidden = true
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.post(name: TabbarController.showNotificationName, object: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "orderCell", for: indexPath) as! OrderCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}
