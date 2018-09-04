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
    var labelTanggalDetail: [String] = []
    
    @IBOutlet weak var gambarDetail: UIImageView!
    @IBOutlet weak var tanggalDetail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gambarDetail.image = imageGambarDetail[index]
        tanggalDetail.text = labelTanggalDetail[index]
        
   
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
