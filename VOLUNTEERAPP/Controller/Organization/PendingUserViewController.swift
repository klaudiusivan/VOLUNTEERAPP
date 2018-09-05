//
//  PendingUserViewController.swift
//  VOLUNTEERAPP
//
//  Created by Klaudius Ivan on 03/09/18.
//  Copyright © 2018 Klaudius. All rights reserved.
//

import UIKit
import Firebase

class PendingUserViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var ref:DatabaseReference!
    var users:[User] = []
    var navigationBarAppearace = UINavigationBar.appearance()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = pendingUserTable.dequeueReusableCell(withIdentifier: "PendingUserCell", for: indexPath) as? PendingUserTableViewCell
        var a:String
        if users[indexPath.row].verified == 0 {
             a = "NO"
        } else {
             a = "YES"
        }
        
        cell?.imagePendingUserCell.image = gambarPendingUser[0]
        cell?.namePendingUserCell.text = users[indexPath.row].name
        cell?.skillPendingUserCell.text = a
        
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
            destination.users = users
            destination.index = clickedIndex
            
        }
    }
    
    
    @IBOutlet weak var pendingUserTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Navigation bar
        navigationBarAppearace.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        navigationBarAppearace.barTintColor = #colorLiteral(red: 0.4980392157, green: 0.768627451, blue: 0.2039215686, alpha: 1)
        ref = Database.database().reference()
        self.loadDataFromFirebase()
        // Do any additional setup after loading the view.
    }
    
    func loadDataFromFirebase() {
        self.ref.child("users").queryOrdered(byChild: "verified").queryEqual(toValue: 0).observe(.value) { (snapshot) in
            self.users.removeAll()
            let x = snapshot.value as? [String: Any] ?? [:]
            for (_,value) in x {
                let b = value as! [String:Any]
                let a = User(
                UID: b["UID"] as! String,
                email: b["email"] as! String,
                name: b["name"] as! String,
                skills: b["skills"] as! [String:String],
                verified: b["verified"] as! Int
            )
            self.users.append(a)
            self.pendingUserTable.reloadData()
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //            let x = snapshot.value as! [String: Any]
//    print("A")
    //            print(x)
    //            let a = User(
    //                UID: x["UID"] as! String,
    //                email: x["email"] as! String,
    //                name: x["name"] as! String,
    //                skills: x["skills"] as! [Int:Int],
    //                verified: x["verified"] as! Int
    //            )
    //            self.users.append(a)
    //            print(a.skills)
    //            self.pendingUserTable.reloadData()
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
