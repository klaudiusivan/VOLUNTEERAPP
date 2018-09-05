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
    
    @IBOutlet weak var backView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backView.layer.cornerRadius = 3
        
        self.backView.layer.shadowOpacity = 0.5
        self.backView.layer.shadowOffset = CGSize(width: 0, height: 5)
        self.backView.layer.shadowRadius = 2
        self.backView.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.backView.layer.masksToBounds = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
