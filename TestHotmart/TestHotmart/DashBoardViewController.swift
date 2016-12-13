//
//  MainViewController.swift
//  TestHotmart
//
//  Created by Rodrigo A E Miyashiro on 12/12/16.
//  Copyright © 2016 Rodrigo Miyashiro. All rights reserved.
//

import UIKit
import SWRevealViewController

class DashBoardViewController: UIViewController {
    
    // MARK: - Lets and Vars
    
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var openMenu: UIBarButtonItem!
    @IBOutlet weak var dashboardTableView: UITableView!
    @IBOutlet weak var lblCurrentBalance: UILabel!
    @IBOutlet weak var btnSearch: UIButton!
    
    
    
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
        // Translucent navigationbar
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
        self.navigationController?.navigationBar.tintColor = UIColor(hex: Color.white.rawValue)
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        self.title = NSLocalizedString("Dashboard", comment: "title section")
    }

    
    // MARK: - IBActions
    @IBAction func searchBalances(_ sender: UIButton) {
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


// MARK: - TableView DataSource
extension DashBoardViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return CGFloat(201)
        }
        
        return CGFloat(115)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: TableViewCell!
        let row = indexPath.row
        var sideIndicatorColor: String!
        
        if row == 0 {
            let CellIdentifier = "CellToCollectionView"
            cell = dashboardTableView.dequeueReusableCell(withIdentifier: CellIdentifier, for: indexPath) as! TableViewCellToUseWithCollectionView
            
            sideIndicatorColor = Color.orange.rawValue
            
        }
        else {
            let CellIdentifier = "CellToTableView"
            cell = dashboardTableView.dequeueReusableCell(withIdentifier: CellIdentifier, for: indexPath) as! OthersTableViewCell
            
            sideIndicatorColor = Color.blue.rawValue
        }
        
        var color = UIColor()
        if row % 2 == 1 {
            color = UIColor(hex: Color.lighterGray.rawValue)
        }
        else {
            color = UIColor(hex: Color.white.rawValue)
        }
        
        cell.sideIndicator.backgroundColor = UIColor(hex: sideIndicatorColor)
        cell?.backgroundColor = color
        
        
        return cell
    }
}


// MARK: - TableView Delegate
extension DashBoardViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dashboardTableView.deselectRow(at: indexPath, animated: true)
    }
}


// MARK: - CollectionView DataSource
extension DashBoardViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let CellIdentifier = "CollectionViewCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier, for: indexPath) as! PeopleCollectionViewCell
        
        cell.imgUserPhoto.layer.masksToBounds = false
        cell.imgUserPhoto.layer.cornerRadius = cell.imgUserPhoto.layer.frame.height/2
        cell.imgUserPhoto.clipsToBounds = true
        cell.imgUserPhoto.backgroundColor = UIColor.blue
        
        return cell
    }
}


// MARK: - CollectionView Delegate
extension DashBoardViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}
