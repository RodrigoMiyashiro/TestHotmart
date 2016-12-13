//
//  UICollectionViewCell.swift
//  TestHotmart
//
//  Created by Rodrigo A E Miyashiro on 12/12/16.
//  Copyright © 2016 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

extension UICollectionViewCell {
    
    func roundImage<cell: MessageCollectionViewCell>(_ cellSelected: cell) {
        cellSelected.imgUserPhoto.layer.masksToBounds = false
        cellSelected.imgUserPhoto.layer.cornerRadius = cellSelected.imgUserPhoto.layer.frame.height/2
        cellSelected.imgUserPhoto.clipsToBounds = true
    }
}
