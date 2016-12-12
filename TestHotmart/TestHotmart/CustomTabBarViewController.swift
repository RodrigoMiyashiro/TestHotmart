//
//  CustomTabBarViewController.swift
//  Test Hotmart
//
//  Created by Rodrigo A E Miyashiro on 11/12/16.
//  Copyright © 2016 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

class CustomTabBarViewController: UITabBarController, CustomTabBarDataSource, CustomTabBarDelegate {

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.isHidden = true
        
        setheightTabBar()
        
        let customTabBar = CustomTabBar(frame: self.tabBar.frame)
        customTabBar.dataSource = self
        customTabBar.delegate = self
        customTabBar.setup()
        self.view.addSubview(customTabBar)
    }
    
    func setheightTabBar() {
        let oldHeight = self.tabBar.frame.size.height
        self.tabBar.frame.size.height = 68
        let newHeight = self.tabBar.frame.size.height
        self.tabBar.frame.origin.y -= newHeight - oldHeight
    }
    
    
    // MARK: - Show Menu
    @IBAction func showMenu(_ sender: UIBarButtonItem) {
        self.slideMenuController()?.openLeft()
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
