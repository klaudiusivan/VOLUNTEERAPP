//
//  OpportunitiesViewController.swift
//  VOLUNTEERAPP
//
//  Created by Ivan Riyanto on 04/09/18.
//  Copyright © 2018 Klaudius. All rights reserved.
//

import UIKit
import Firebase

class OpportunitiesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    var ref:DatabaseReference!
    var opportunities:[Opportunity]=[]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return opportunities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = opportunitiesTable.dequeueReusableCell(withIdentifier: "OpportunitiesCell", for: indexPath) as? OpportunitiesTableViewCell
        let totalVol = opportunities[indexPath.row].dapur + opportunities[indexPath.row].medis + opportunities[indexPath.row].sar
        cell!.gambarOpportunitiesCell.image = gambarEventOpportunities[1]
        cell!.namaEventOpportunitiesCell.text = opportunities[indexPath.row].namaOpportunity
        cell!.tanggalEventOpportunitiesCell.text = "\(opportunities[indexPath.row].tanggalMulai) - \(opportunities[indexPath.row].tanggalSelesai)"
        cell!.neededEventOpportunitiesCell.text = "\(totalVol) Volunteer/s needed"
        return cell!
    }
    
    var clickedIndex : Int = 0
    
//    var namaEventOpportunities : [String] = ["Gempa Lombok","Gempa Jogja"]
//
    var tanggalEventOpportunities : [String] = ["16 Agustus - 16 September","1 Agustus - 20 Agustus"]
//
//    var neededEventOpportunities : [String] = ["5 Volunteer Needed","8 Volunter Needed"]
//
    var gambarEventOpportunities : [UIImage] = [
        UIImage(named: "gempa1")!,
        UIImage(named: "gempa2")!
    ]
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        clickedIndex = indexPath.row
        performSegue(withIdentifier: "DetailOpportunities", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailOpportunitiesViewController{
            

            
            destination.imageGambarDetail = gambarEventOpportunities
            destination.opportunities = opportunities
            destination.index = clickedIndex
            
    
        }
    }
    
    
    @IBOutlet weak var opportunitiesTable: UITableView!
    var navigationBarAppearace = UINavigationBar.appearance()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Navigation bar
        navigationBarAppearace.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        navigationBarAppearace.barTintColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        // change navigation item title color
        
        ref = Database.database().reference()
            self.loadDataFromFirebase()
        
        // Do any additional setup after loading the view.
    }
    
    func loadDataFromFirebase() {
//        self.ref.child("opportunities").observe(.childAdded) { (snapshot) in
//            let x = snapshot.value as? [String: Any] ?? [:]
//
//            let a = Opportunity(
//                    namaOpportunity: x["namaOpportunity"] as! String,
//                    tanggalMulai: x["tanggalMulai"] as! String,
//                    tanggalSelesai: x["tanggalSelesai"] as! String,
//                    tempat: x["tempat"] as! String,
//                    sar: x["sar"] as! Int,
//                    medis: x["medis"] as! Int,
//                    dapur: x["dapur"] as! Int,
//                    UID: x["UID"] as! String
//            )
//            self.opportunities.append(a)
//            self.opportunitiesTable.reloadData()
//        }
        self.ref.child("opportunities").observe(.value) { (snapshot) in
            self.opportunities.removeAll()
            let x = snapshot.value as? [String: Any] ?? [:]
            for (_,value) in x {
                let b = value as! [String:Any]
                let a = Opportunity(
                    namaOpportunity: b["namaOpportunity"] as! String, //String
                    tanggalMulai: b["tanggalMulai"] as! String, //String
                    tanggalSelesai: b["tanggalSelesai"] as! String, //String
                    tempat: b["tempat"] as! String, //String
                    sar: b["sar"] as! Int, //Int
                    medis: b["medis"] as! Int, //Int
                    dapur: b["dapur"] as! Int, //Int
                    UID: b["UID"] as! String //String
                )
                self.opportunities.append(a)
                self.opportunitiesTable.reloadData()
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}
