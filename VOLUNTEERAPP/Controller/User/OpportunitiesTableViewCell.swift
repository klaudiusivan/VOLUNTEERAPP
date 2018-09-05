//
//  OpportunitiesTableViewCell.swift
//  VOLUNTEERAPP
//
//  Created by Ivan Riyanto on 04/09/18.
//  Copyright © 2018 Klaudius. All rights reserved.
//

import UIKit

class OpportunitiesTableViewCell: UITableViewCell {

    @IBOutlet weak var gambarOpportunitiesCell: UIImageView!
    @IBOutlet weak var namaEventOpportunitiesCell: UILabel!
    @IBOutlet weak var tanggalEventOpportunitiesCell: UILabel!
    @IBOutlet weak var neededEventOpportunitiesCell: UILabel!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var lokasiEventOpportunitiesCell: UILabel!
    
    
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
