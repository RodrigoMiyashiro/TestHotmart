//
//  MenuViewController.swift
//  Test Hotmart
//
//  Created by Rodrigo A E Miyashiro on 12/12/16.
//  Copyright © 2016 Rodrigo Miyashiro. All rights reserved.
//

import UIKit


enum LeftMenu: Int {
    case dashboard = 0
    case mySales
    case myProducts
    case affiliates
    case messages
    case notifications
    case myAccount
    case aboutThisApp
}


class MenuViewController: UITableViewController {
    
    // MARK: - Lets and Vars
    var menuOptions = Array<Any>().optionMenu()
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var imgUserTopBackground: UIImageView!
    @IBOutlet weak var imgBlur: UIImageView!
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblUserEmail: UILabel!
    @IBOutlet weak var menuTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueMessage" {
            let destination = segue.destination as! CustomTabBarViewController
            destination.selectedIndex = 0
        }
        
        if segue.identifier == "segueSales" {
            let destination = segue.destination as! CustomTabBarViewController
            destination.selectedIndex = 1
        }
        
        if segue.identifier == "segueNotification" {
            let destination = segue.destination as! CustomTabBarViewController
            destination.selectedIndex = 2
        }
    }

}

extension MenuViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuOptions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "CellMenu"
        let cell = menuTableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MenuTableViewCell
        
        let row = indexPath.row
        
        
        if let imgName = ImageName(rawValue: row) {
            cell.imgIconOption.image = UIImage(named: imgName.str)
        }
        let option = menuOptions[row]
        cell.lblNameOption.text = option
        
        return cell
    }
}

extension MenuViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        menuTableView.deselectRow(at: indexPath, animated: true)
        
        let rowSelected = indexPath.row
        
        switch rowSelected {
        case LeftMenu.dashboard.rawValue:
            performSegue(withIdentifier: "segueDashboard", sender: self)
        case LeftMenu.messages.rawValue:
            performSegue(withIdentifier: "segueMessage", sender: self)
        case LeftMenu.mySales.rawValue:
            performSegue(withIdentifier: "segueSales", sender: self)
        case LeftMenu.notifications.rawValue:
            performSegue(withIdentifier: "segueNotification", sender: self)
        default:
            break
        }
    }
}


