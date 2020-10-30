//
//  TabbarController.swift
//  es-inventory
//
//  Created by TAM NGUYEN DUC on 10/29/20.
//  Copyright © 2020 TAM NGUYEN DUC. All rights reserved.
//

import UIKit

class TabbarController: BaseViewController {
    @IBOutlet weak var contentView: UIView!
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet var imgViews: [UIImageView]!
    @IBOutlet var iconViews: [UIImageView]!
    @IBOutlet var iconLabels: [UILabel]!
    
    var productViewController: ProductViewController!
    var usersViewController: UsersViewController!
    var ordersViewController: OrdersViewController!
    
    @IBOutlet weak var tabView: UIView!
    var viewControllers : [UIViewController]!
    
    var selectedIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabView.layer.shadowColor = UIColor.black.cgColor
        tabView.layer.shadowOpacity = 0.5
        tabView.layer.shadowOffset = CGSize(width: 0, height: 1)
        tabView.layer.shadowRadius = 10
        tabView.layer.masksToBounds = false
        tabView.layer.shadowPath = UIBezierPath(rect: CGRect(x: 0, y: 0, width: 5, height: 5)).cgPath
        productViewController = ProductViewController(nibName: "ProductViewController", bundle: nil)
        usersViewController = UsersViewController(nibName: "UsersViewController", bundle: nil)
        ordersViewController = OrdersViewController(nibName: "OrdersViewController", bundle: nil)
        viewControllers = [productViewController, usersViewController, ordersViewController]
        buttons[selectedIndex].isSelected = true
        didPressTab(buttons[selectedIndex])
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    @IBAction func didPressTab(_ sender: UIButton) {
        let previousIndex = selectedIndex
        selectedIndex = sender.tag
        // Set ui for previous tab
        buttons[previousIndex].isSelected = false
        
        imgViews[previousIndex].isHidden = true
        
        iconViews[previousIndex].image = iconViews[previousIndex].image?.withRenderingMode(.alwaysTemplate)
        iconViews[previousIndex].tintColor = UIColor.black
        
        iconLabels[previousIndex].textColor = UIColor.black
        
        // set ui for selected tab
        
        imgViews[selectedIndex].isHidden = false
        
        iconViews[selectedIndex].image = iconViews[selectedIndex].image?.withRenderingMode(.alwaysTemplate)
        iconViews[selectedIndex].tintColor = App.Color.tintColor
        
        iconLabels[selectedIndex].textColor = App.Color.tintColor
        
        // remove the previous content view
        let previousVC = viewControllers[previousIndex]
        previousVC.willMove(toParent: nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParent()
        
        // addd the selected content view
        sender.isSelected = true
        let vc = viewControllers[selectedIndex]
        addChild(vc)
        vc.view.frame = contentView.bounds
        contentView.addSubview(vc.view)
        vc.didMove(toParent: self)
        
        
        
    }
}
