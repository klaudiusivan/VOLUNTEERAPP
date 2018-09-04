//
//  PendingUserTableViewCell.swift
//  VOLUNTEERAPP
//
//  Created by Ivan Riyanto on 04/09/18.
//  Copyright © 2018 Klaudius. All rights reserved.
//

import UIKit

class PendingUserTableViewCell: UITableViewCell {

 
    @IBOutlet weak var imagePendingUserCell: UIImageView!
    
    @IBOutlet weak var namePendingUserCell: UILabel!
    
    @IBOutlet weak var skillPendingUserCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
