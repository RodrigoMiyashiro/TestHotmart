//
//  CustomTabBarViewController.swift
//  Test Hotmart
//
//  Created by Rodrigo A E Miyashiro on 11/12/16.
//  Copyright © 2016 Rodrigo Miyashiro. All rights reserved.
//

import UIKit
import SWRevealViewController

class CustomTabBarViewController: UITabBarController, CustomTabBarDataSource, CustomTabBarDelegate {
    
    @IBOutlet weak var openMenu: UIBarButtonItem!
    

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.isHidden = true
        
        showMenu()
        setheightTabBar()
        
        let customTabBar = CustomTabBar(frame: self.tabBar.frame)
        customTabBar.dataSource = self
        customTabBar.delegate = self
        customTabBar.setup()
        self.view.addSubview(customTabBar)
    }
    
    func showMenu() {
        openMenu.target = self.revealViewController()
        openMenu.action = #selector(SWRevealViewController.revealToggle(_:))
    }
    
    
    func setheightTabBar() {
        let oldHeight = self.tabBar.frame.size.height
        self.tabBar.frame.size.height = 68
        let newHeight = self.tabBar.frame.size.height
        self.tabBar.frame.origin.y -= newHeight - oldHeight
    }
    
        
    
    // MARK: - Custom TabBar DataSource
    func tabBarItemsInCustomTabBar(tabBarView: CustomTabBar) -> [UITabBarItem] {

        return tabBar.items!
    }
    
    
    // MARK: - CustomTabBarDelegate
    func didSelectViewController(tabBarView: CustomTabBar, atIndex index: Int) {
        self.selectedIndex = index
    }

}
