//
//  SetProductVC.swift
//  es-inventory
//
//  Created by TAM NGUYEN DUC on 11/4/20.
//  Copyright © 2020 TAM NGUYEN DUC. All rights reserved.
//

import UIKit

class SetProductVC: UIViewController {
    @IBOutlet weak var contentViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var picImageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    var photoShot : UIImage?

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let photoShot = photoShot {
            picImageView.image = photoShot
        }
        
        picImageView.layer.cornerRadius = 10
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

    }

    @IBAction func didAddInformation(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    @IBAction func didBackToCamera(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            contentViewHeightConstraint.constant = keyboardSize.height
            let bottomOffset = CGPoint(x: 0, y: contentViewHeightConstraint.constant + 16)
            scrollView.setContentOffset(bottomOffset, animated: true)
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        contentViewHeightConstraint.constant = 0
        let topOffset = CGPoint(x: 0, y: -scrollView.contentInset.top + 20)
        scrollView.setContentOffset(topOffset, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
