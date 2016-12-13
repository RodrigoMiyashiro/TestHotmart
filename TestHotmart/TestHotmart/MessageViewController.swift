//
//  MessageViewController.swift
//  TestHotmart
//
//  Created by Rodrigo A E Miyashiro on 12/12/16.
//  Copyright © 2016 Rodrigo Miyashiro. All rights reserved.
//

import UIKit
import SWRevealViewController

class MessageViewController: UIViewController {
    
    // MARK: - Lets and Vars
    
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var messageCollectionView: UICollectionView!
    @IBOutlet weak var barBtnItemCounterIndicator: UIBarButtonItem!
    @IBOutlet weak var openMenu: UIBarButtonItem!
    
    
    
    // MARK: - Cycle Life
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
        self.navigationController?.navigationBar.barTintColor = UIColor(hex: Color.orange.rawValue)
        self.navigationController?.navigationBar.tintColor = UIColor(hex: Color.white.rawValue)
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        self.title = NSLocalizedString("Mensagens", comment: "title section")
        
        
        let lblCounter = UILabel(frame: CGRect(x: ((self.navigationController?.navigationBar.frame.width)! - (45 + 10)),
                                                   y: (self.navigationController?.navigationBar.frame.height)! - (30*5/4),
                                                   width: 45,
                                                   height: 30))
        lblCounter.text = "+10"
        lblCounter.backgroundColor = UIColor.white
        lblCounter.textColor = UIColor.black
        lblCounter.textAlignment = .center
        
        self.navigationController?.navigationBar.addSubview(lblCounter)
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


extension MessageViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellIdentifier = "MessageCell"
        let cell = messageCollectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! MessageCollectionViewCell
        
        cell.roundImage(cell)
        
        return cell
    }
    
    
}


