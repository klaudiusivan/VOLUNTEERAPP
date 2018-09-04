//
//  DetailOpportunitiesViewController.swift
//  VOLUNTEERAPP
//
//  Created by Ivan Riyanto on 04/09/18.
//  Copyright © 2018 Klaudius. All rights reserved.
//

import UIKit

class DetailOpportunitiesViewController: UIViewController {
    
    var index : Int = 0
    var imageGambarDetail: [UIImage] = []
    var opportunities: [Opportunity] = []
    
    @IBOutlet weak var tanggalLbl: UILabel!
    @IBOutlet weak var titleEvent: UILabel!
    @IBOutlet weak var totalVolLable: UILabel!
    @IBOutlet weak var gambarDetail: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var totalVol = opportunities[index].dapur + opportunities[index].medis + opportunities[index].sar
        gambarDetail.image = imageGambarDetail[1]
        titleEvent.text = opportunities[index].namaOpportunity
        tanggalLbl.text = "\(opportunities[index].tanggalMulai)-\(opportunities[index].tanggalSelesai)"
        totalVolLable.text = "\(totalVol) Volunteer/s Needed"
        
   
        // Do any additional setup after loading the view.
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
