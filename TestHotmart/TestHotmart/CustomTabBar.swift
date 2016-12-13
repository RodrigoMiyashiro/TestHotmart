//
//  CustomTabBar.swift
//  CustomTabBar
//
//  Created by Rodrigo A E Miyashiro on 11/12/16.
//  Copyright © 2016 Swift Joureny. All rights reserved.
//

import UIKit


protocol CustomTabBarDataSource {
    func tabBarItemsInCustomTabBar(tabBarView: CustomTabBar) -> [UITabBarItem]
}

protocol CustomTabBarDelegate {
    func didSelectViewController(tabBarView: CustomTabBar, atIndex index: Int)
}

class CustomTabBar: UIView {
    
    var dataSource: CustomTabBarDataSource!
    var delegate: CustomTabBarDelegate!
    
    var tabBarItems: [UITabBarItem]!
    var customTabBarItems: [CustomTabBarItem]!
    var tabBarButtons: [UIButton]!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor(hex: Color.white.rawValue)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setup() {
        // Get tabbar items from default tabbar
        tabBarItems = dataSource.tabBarItemsInCustomTabBar(tabBarView: self)
        
        customTabBarItems = []
        tabBarButtons = []
        
        linesInTabBar()
        separeteItemsTabBar()
        
        let containers = createTabBarItemContainers()
        createTabBarItems(containers: containers)
        
    }
    
    func linesInTabBar() {
        let tabBarWidth = self.frame.width

        let topLine = UIView(frame: CGRect(x: 0, y: 0, width: tabBarWidth, height: 0.5))
        topLine.backgroundColor = UIColor(hex: Color.lightGray.rawValue)
        self.insertSubview(topLine, at: 1)
    }
    
    func separeteItemsTabBar () {
        if let items = tabBarItems {
            
            let height = self.frame.height
            
            let itemSize = CGSize(
                width: self.frame.width/CGFloat(items.count),
                height: height)
            
            for index in items.enumerated() {
                if index.offset > 0 {
                    let xPosition = itemSize.width * CGFloat(index.offset)
                    let separator = UIView(frame: CGRect(x: xPosition, y: 12, width: 0.5, height: height - 24))
                    separator.backgroundColor = UIColor(hex: Color.lightGray.rawValue)
                    self.insertSubview(separator, at: 1)
                }
            }
        }
    }
    
    
    func createTabBarItems(containers: [CGRect]) {
        
        var index = 0
        for item in tabBarItems {
            let container = containers[index]
            
            let customTabBarItem = CustomTabBarItem(frame: container)
            customTabBarItem.setup(item: item)
            
            self.addSubview(customTabBarItem)
            customTabBarItems.append(customTabBarItem)
            
            let button = UIButton(frame: CGRect(x: 0, y: 0, width: container.width, height: container.height))
            button.addTarget(self, action: #selector(CustomTabBar.barItemTapped(_:)), for: UIControlEvents.touchUpInside)
            
            customTabBarItem.addSubview(button)
            tabBarButtons.append(button)
            
            index += 1
        }
    }
    
    func createTabBarItemContainers() -> [CGRect] {
        
        var containerArray = [CGRect]()
        
        // create container for each tab bar item
        for index in 0..<tabBarItems.count {
            let tabBarContainer = createTabBarContainer(index: index)
            containerArray.append(tabBarContainer)
        }
        
        return containerArray
    }
    
    func createTabBarContainer(index: Int) -> CGRect {
        
        let tabBarContainerWidth = self.frame.width / CGFloat(tabBarItems.count)
        let tabBarContainerRect = CGRect(x: tabBarContainerWidth * CGFloat(index), y: 0, width: tabBarContainerWidth, height: self.frame.height)
        
        return tabBarContainerRect
    }
    
    func barItemTapped(_ sender : UIButton) {
        let index = tabBarButtons.index(of: sender)!
        
        delegate.didSelectViewController(tabBarView: self, atIndex: index)
    }
    
}
