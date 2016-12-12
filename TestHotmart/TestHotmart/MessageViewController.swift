//
//  MessageViewController.swift
//  TestHotmart
//
//  Created by Rodrigo A E Miyashiro on 12/12/16.
//  Copyright © 2016 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

class MessageViewController: UIViewController {
    
    // MARK: - Lets and Vars
    
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var messageCollectionView: UICollectionView!
    @IBOutlet weak var barBtnItemCounterIndicator: UIBarButtonItem!
    
    
    
    // MARK: - Cycle Life
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        self.title = "Mensagem"//NSLocalizedString("Mensagens", comment: "title section")
        navigationColor()
    }
    
    func navigationColor() {
        self.navigationController?.navigationBar.barTintColor = UIColor(hex: Color.orange.rawValue)
        self.navigationController?.navigationBar.tintColor = UIColor(hex: Color.white.rawValue)
        
        self.navigationController?.navigationBar.topItem?.title = NSLocalizedString("Mensagens", comment: "title section")
        
//        let lblTitle = UILabel()
//        lblTitle.text = "Mensagens"
//        lblTitle.textColor = UIColor.white
//        
//        self.navigationController?.navigationBar.topItem?.titleView = lblTitle
        
        self.navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(title: "+10", style: UIBarButtonItemStyle.plain, target: self, action: nil)
        
        let lblCounter = UILabel(frame: CGRect(x: 0, y: 0, width: 45, height: 30))
        lblCounter.text = "+10"
        lblCounter.backgroundColor = UIColor.white
        lblCounter.textColor = UIColor.black
        lblCounter.textAlignment = .center
        self.navigationController?.navigationBar.topItem?.rightBarButtonItem?.customView = lblCounter
        
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


