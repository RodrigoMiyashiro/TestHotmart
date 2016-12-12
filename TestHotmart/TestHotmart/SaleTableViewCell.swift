//
//  SaleTableViewCell.swift
//  TestHotmart
//
//  Created by Rodrigo A E Miyashiro on 12/12/16.
//  Copyright © 2016 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

class SaleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblIdAndDate: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
    @IBOutlet weak var imgAlert: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
