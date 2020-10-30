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
    
    var productViewController: ProductViewController!
    var usersViewController: UsersViewController!
    var ordersViewController: OrdersViewController!
    
    var viewControllers : [UIViewController]!
    
    var selectedIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        buttons[previousIndex].isSelected = false
        let previousVC = viewControllers[previousIndex]
        previousVC.willMove(toParent: nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParent()
        
        sender.isSelected = true
        let vc = viewControllers[selectedIndex]
        addChild(vc)
        vc.view.frame = contentView.bounds
        contentView.addSubview(vc.view)
        vc.didMove(toParent: self)
        
        
        
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
