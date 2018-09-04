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
    
    @IBOutlet weak var medicSkillLbl: UILabel!
    @IBOutlet weak var dapurSkillLbl: UILabel!
    @IBOutlet weak var SARSkillLbl: UILabel!
    
    
    var index : Int = 0
    
    var imageGambarDetail : [UIImage] = []
    
    var labelNamaDetail : [String] = []
    
    var labelGenderDetail : [String] = []
    
    var labelEmailDetail : [String] = []
    
    var labelSkillDetail : [String] = []
    
    var users: [User] = []
    var medicSkill:String = "NO"
    var DapurSkill:String = "NO"
    var SARSkill:String = "NO"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if users[index].skills["10"] == "1" {
            DapurSkill = "YES"
        } else {
            DapurSkill = "NO"
        }
        if users[index].skills["13"] == "1" {
            medicSkill = "YES"
        } else {
            medicSkill = "NO"
        }
        if users[index].skills["6"] == "1" {
            SARSkill = "YES"
        } else {
            SARSkill = "NO"
        }
        
        
        gambarDetailUserPending.image = imageGambarDetail[0]
        namaDetailUserPending.text = users[index].name
        emailDetailUserPending.text = users[index].email
        SARSkillLbl.text = SARSkill
        medicSkillLbl.text = medicSkill
        dapurSkillLbl.text = DapurSkill
        
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
