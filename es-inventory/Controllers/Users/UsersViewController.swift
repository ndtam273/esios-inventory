//
//  UsersViewController.swift
//  es-inventory
//
//  Created by TAM NGUYEN DUC on 10/29/20.
//  Copyright © 2020 TAM NGUYEN DUC. All rights reserved.
//

import UIKit

class UsersViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    
    @IBOutlet weak var addUserBotConstraint: NSLayoutConstraint!
    @IBOutlet weak var alphaView: UIView!
    @IBOutlet weak var addUserView: UIView!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = App.Text.titleUsers
        addUserView.layer.cornerRadius = 10
        hidePopup()
        
        let nib = UINib(nibName: "UserCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "userCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.keyboardDismissMode = .onDrag
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        let floatButton = UIButton(frame: CGRect(x: 150, y: 550, width: 85, height: 90))
        floatButton.frame.origin = CGPoint(x: screenWidth - 26 - floatButton.bounds.size.width , y: screenHeight - 150 - floatButton.bounds.size.height)
        floatButton.setImage(UIImage(named: "add_user_btn.png"), for: .normal)
        floatButton.addTarget(self, action: #selector(didAddUser), for: .touchUpInside)
        self.view.insertSubview(floatButton, belowSubview: alphaView)
        
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        hidePopup()
    }

//    override func setupUI() {
//        super.viewDidLoad()
//        
//        
//    }
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.addUserBotConstraint.constant < keyboardSize.height {
                addUserBotConstraint.constant = keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        self.addUserBotConstraint.constant = 220
    }
    func showPopup() {
        alphaView.isHidden = false
        addUserView.isHidden = false
    }
    
    func hidePopup() {
        alphaView.isHidden = true
        addUserView.isHidden = true
    }
    @IBAction func handleTapAlphaView(_ sender: Any) {
        hidePopup()
        view.endEditing(false)
    }
    @objc func didAddUser() {
        showPopup()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UserCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    

}
