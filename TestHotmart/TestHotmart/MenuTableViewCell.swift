//
//  MenuTableViewCell.swift
//  TestHotmart
//
//  Created by Rodrigo A E Miyashiro on 12/12/16.
//  Copyright © 2016 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgIconOption: UIImageView!
    @IBOutlet weak var lblNameOption: UILabel!
    @IBOutlet weak var lblNumberIndicator: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
