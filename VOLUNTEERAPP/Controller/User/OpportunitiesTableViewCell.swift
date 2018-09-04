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
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
