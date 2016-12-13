//
//  NotificationViewController.swift
//  TestHotmart
//
//  Created by Rodrigo A E Miyashiro on 12/12/16.
//  Copyright © 2016 Rodrigo Miyashiro. All rights reserved.
//

import UIKit
import SWRevealViewController

class NotificationViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak var openMenu: UIBarButtonItem!
    
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showMenu()
    }
    
    func showMenu() {
        openMenu.target = self.revealViewController()
        openMenu.action = #selector(SWRevealViewController.revealToggle(_:))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationColor()
    }
    
    func navigationColor() {
        self.navigationController?.navigationBar.barTintColor = UIColor(hex: Color.purple.rawValue)
        self.navigationController?.navigationBar.tintColor = UIColor(hex: Color.white.rawValue)
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        self.title = NSLocalizedString("Notificações", comment: "title section")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
