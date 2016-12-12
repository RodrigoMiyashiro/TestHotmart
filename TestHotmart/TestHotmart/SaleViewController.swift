//
//  SaleViewController.swift
//  TestHotmart
//
//  Created by Rodrigo A E Miyashiro on 12/12/16.
//  Copyright © 2016 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

class SaleViewController: UIViewController {
    
    // MARK: - Lets and Vars
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var salesTableView: UITableView!
    
    

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationColor()
    }
    
    func navigationColor() {
        self.navigationController?.navigationBar.barTintColor = UIColor(hex: Color.blue.rawValue)
        self.navigationController?.navigationBar.tintColor = UIColor(hex: Color.white.rawValue)
        self.navigationController?.navigationBar.topItem?.title = NSLocalizedString("Minhas Vendas", comment: "title section")
        
        self.navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem()
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


extension SaleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "CellSales"
        let cell = salesTableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! SaleTableViewCell
        
        let row = indexPath.row
        var color = UIColor()
        if row % 2 == 0 {
            color = UIColor(hex: Color.lighterGray.rawValue)
        }
        else {
            color = UIColor(hex: Color.white.rawValue)
        }
        
        cell.backgroundColor = color
        
        
        return cell
    }
}
