//
//  OpportunitiesCell.swift
//  VOLUNTEERAPP
//
//  Created by Klaudius Ivan on 04/09/18.
//  Copyright © 2018 Klaudius. All rights reserved.
//

import UIKit

class OpportunitiesCell: UITableViewCell{

    @IBOutlet weak var gambarOpportunitiesImage: UIImageView!
    
    @IBOutlet weak var namaOpportunitiesLabel: UILabel!
    
    @IBOutlet weak var tanggalOpportunitiesLabel: UILabel!
    
    @IBOutlet weak var tempatOpportunitiesLabel: UILabel!
    
    @IBOutlet weak var statusOpportunitiesLabel: UILabel!
    
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
    func setOpportunitiesCell() {
        
    }
}
