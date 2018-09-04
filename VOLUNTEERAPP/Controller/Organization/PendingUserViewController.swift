//
//  PendingUserViewController.swift
//  VOLUNTEERAPP
//
//  Created by Klaudius Ivan on 03/09/18.
//  Copyright © 2018 Klaudius. All rights reserved.
//

import UIKit

class PendingUserViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return namaPendingUser.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = pendingUserTable.dequeueReusableCell(withIdentifier: "PendingUserCell", for: indexPath) as? PendingUserTableViewCell
        
        cell?.imagePendingUserCell.image = gambarPendingUser[indexPath.row]
        cell?.namePendingUserCell.text = namaPendingUser[indexPath.row]
        cell?.skillPendingUserCell.text = skillPendingUser[indexPath.row]
        
        return cell!
    }
    
    
    var gambarPendingUser : [UIImage] = [UIImage(named: "Profile1")!,
         UIImage(named: "Profile2")!,
         UIImage(named: "Profile3")!
    ]
    
    var namaPendingUser : [String] = ["Fadhil","James","Hikari"]
    
    var skillPendingUser : [String] = ["Medic","Transport","SAR"]
    
    
    var clickedIndex : Int = 0

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        clickedIndex = indexPath.row
        performSegue(withIdentifier: "DetailPendingUser", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailPendingUserViewController{
            
            
            
            destination.imageGambarDetail = gambarPendingUser
            destination.labelNamaDetail = namaPendingUser
            destination.labelSkillDetail = skillPendingUser
            
            
            destination.index = clickedIndex
            
            
        }
    }
    
    
    @IBOutlet weak var pendingUserTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
