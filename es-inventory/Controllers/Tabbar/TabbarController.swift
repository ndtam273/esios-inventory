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
    
    var viewControllers = [UIViewController]?.self
    
    var selectedIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productViewController = ProductViewController(nibName: "ProductViewController", bundle: nil)
        usersViewController = UsersViewController(nibName: "UsersViewController", bundle: nil)
        ordersViewController = OrdersViewController(nibName: "OrdersViewController", bundle: nil)
        viewControllers = [productViewController, usersViewController, ordersViewController]

        // Do any additional setup after loading the view.
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
