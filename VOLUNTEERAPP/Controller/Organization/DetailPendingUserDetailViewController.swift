//
//  PendingUserDetailViewController.swift
//  VOLUNTEERAPP
//
//  Created by Klaudius Ivan on 03/09/18.
//  Copyright © 2018 Klaudius. All rights reserved.
//

import UIKit

class DetailPendingUserViewController: UIViewController {

    
    @IBOutlet weak var gambarDetailUserPending: UIImageView!
    
    @IBOutlet weak var namaDetailUserPending: UILabel!
    
    @IBOutlet weak var UmurDetailUserPending: UILabel!
    
    @IBOutlet weak var genderDetailUserPending: UILabel!
    
    @IBOutlet weak var emailDetailUserPending: UILabel!
    
    
    var index : Int = 0
    
    var imageGambarDetail : [UIImage] = []
    
    var labelNamaDetail : [String] = []
    
    var labelGenderDetail : [String] = []
    
    var labelEmailDetail : [String] = []
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        gambarDetailUserPending.image = imageGambarDetail[index]
        namaDetailUserPending.text = labelNamaDetail[index]
        
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
