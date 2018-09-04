//
//  OpportunitiesApplicantViewController.swift
//  VOLUNTEERAPP
//
//  Created by Klaudius Ivan on 03/09/18.
//  Copyright © 2018 Klaudius. All rights reserved.
//

import UIKit

class OpportunitiesApplicantViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return namaOpportunities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = jenisOpportunitiesTable.dequeueReusableCell(withIdentifier: "JenisOpportunities", for: indexPath) as? OpportunitiesCell
        
        cell?.gambarOpportunitiesImage.image = gambarOpportunities[indexPath.row]
        cell?.namaOpportunitiesLabel.text = namaOpportunities[indexPath.row]
        cell?.tanggalOpportunitiesLabel.text = tanggalOpportunities[indexPath.row]
        cell?.tempatOpportunitiesLabel.text = tempatOpportunities[indexPath.row]
        cell?.statusOpportunitiesLabel.text = statusOpportunities[indexPath.row]
        
        return cell!
    }
    
    //MARK - Outlets
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        clickedIndex = indexPath.row
        performSegue(withIdentifier: "DetailHopeApplicant", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailOpportunitiesApplicantViewController{
            
            
            destination.namaOpportunities = namaOpportunities
            destination.waktuOpportunities = tanggalOpportunities
            destination.lokasiOpportunities = tempatOpportunities
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


