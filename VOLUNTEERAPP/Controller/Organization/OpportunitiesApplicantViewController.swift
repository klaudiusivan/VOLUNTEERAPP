//
//  OpportunitiesApplicantViewController.swift
//  VOLUNTEERAPP
//
//  Created by Klaudius Ivan on 03/09/18.
//  Copyright © 2018 Klaudius. All rights reserved.
//

import UIKit
import Firebase

class OpportunitiesApplicantViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var ref:DatabaseReference!
    var opportunities:[Opportunity] = []
    var navigationBarAppearace = UINavigationBar.appearance()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return opportunities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = jenisOpportunitiesTable.dequeueReusableCell(withIdentifier: "JenisOpportunities", for: indexPath) as? OpportunitiesCell
        
        let totalVol = opportunities[indexPath.row].dapur + opportunities[indexPath.row].medis + opportunities[indexPath.row].sar
        
//        cell?.gambarOpportunitiesImage.image = gambarOpportunities[0]
        cell?.namaOpportunitiesLabel.text = opportunities[indexPath.row].namaOpportunity
        cell?.tanggalOpportunitiesLabel.text = "\(opportunities[indexPath.row].tanggalMulai) - \(opportunities[indexPath.row].tanggalSelesai)"
        cell?.tempatOpportunitiesLabel.text = opportunities[indexPath.row].tempat
        cell?.statusOpportunitiesLabel.text = "\(totalVol) volunteers needed"
        
        return cell!
    }
    
    //MARK - Outlets
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        clickedIndex = indexPath.row
        performSegue(withIdentifier: "DetailHopeApplicant", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailOpportunitiesApplicantViewController{
            
            
            destination.opportunities = opportunities
            destination.index = clickedIndex
           
//            destination.labelTanggalDetail = tanggalEventOpportunities
            destination.index = clickedIndex
        }
    }
    
    
    @IBOutlet weak var jenisOpportunitiesTable: UITableView!
    
    var clickedIndex : Int = 0
   
    var namaOpportunities : [String] = ["Gempa Lombok","Gempa Yogya"]
    
    var tanggalOpportunities : [String] = ["16 Agustus - 16 September","1 Agustus - 20 Agustus"]
    
    var tempatOpportunities : [String] = ["Lombok","Yogya"]
    
    var statusOpportunities : [String] = ["15 of 20 Volunteer Needed","8 of 12 Volunteeer Needed"]
    
    var gambarOpportunities : [UIImage] = [UIImage(named: "GempaLombok")!,UIImage(named: "GempaJogja")!]
    
    
    
    
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
//        self.ref.child("opportunities").observe(.childAdded) { (snapshot) in
//            let x = snapshot.value as! [String: Any]
//
//            let a = Opportunity(
//                namaOpportunity: x["namaOpportunity"] as! String,
//                tanggalMulai: x["tanggalMulai"] as! String,
//                tanggalSelesai: x["tanggalSelesai"] as! String,
//                tempat: x["tempat"] as! String,
//                sar: x["sar"] as! Int,
//                medis: x["medis"] as! Int,
//                dapur: x["dapur"] as! Int,
//                UID: x["UID"] as! String
//            )
//            self.opportunities.append(a)
//            self.jenisOpportunitiesTable.reloadData()
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
                self.jenisOpportunitiesTable.reloadData()
            }
        }
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

//extension OpportunitiesApplicantViewController: UITableViewDataSource,UITableViewDelegate{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 0
//    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//
//    }
//
//}


