//
//  UIViewController.swift
//  TestHotmart
//
//  Created by Rodrigo A E Miyashiro on 12/12/16.
//  Copyright © 2016 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func setNavigationBarItem(title: String, colorStr: String) {
        self.navigationController?.navigationBar.barTintColor = UIColor(hex: colorStr)
        self.navigationController?.navigationBar.tintColor = UIColor(hex: Color.white.rawValue)
        
        self.navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(title: "+10", style: UIBarButtonItemStyle.plain, target: self, action: nil)
        
        let lblCounter = UILabel(frame: CGRect(x: 0, y: 0, width: 45, height: 30))
        lblCounter.text = "+10"
        lblCounter.backgroundColor = UIColor.white
        lblCounter.textColor = UIColor.black
        lblCounter.textAlignment = .center
        self.navigationController?.navigationBar.topItem?.rightBarButtonItem?.customView = lblCounter
        self.navigationController?.navigationBar.topItem?.titleView = UIView()
    }
}
