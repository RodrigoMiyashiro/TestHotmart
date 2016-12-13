//
//  TableViewCellToUseWithCollectionView.swift
//  TestHotmart
//
//  Created by Rodrigo A E Miyashiro on 13/12/16.
//  Copyright © 2016 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

class TableViewCellToUseWithCollectionView: TableViewCell {

    @IBOutlet weak var lblCounter: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
}


extension TableViewCellToUseWithCollectionView {
    func setCollectionViewDataSourceDelegate<deleg: UICollectionViewDataSource & UICollectionViewDelegate> (_ dataSourceDelegate: deleg, forRow row: Int) {
        
        collectionView.dataSource = dataSourceDelegate
        collectionView.delegate = dataSourceDelegate
        collectionView.tag = row
        collectionView.setContentOffset(collectionView.contentOffset, animated: false) // Stop collectionView if it was scrolling        
    }
    
    var colelctionViewOffSet: CGFloat {
        set {
            collectionView.contentOffset.x = newValue
        }
        
        get {
            return collectionView.contentOffset.x
        }
    }
    
    func reloadCollectionView(_ notification: Notification) {
        self.collectionView.reloadData()
    }
}
