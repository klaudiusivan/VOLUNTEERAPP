//
//  OpportunitiesViewController.swift
//  VOLUNTEERAPP
//
//  Created by Ivan Riyanto on 04/09/18.
//  Copyright © 2018 Klaudius. All rights reserved.
//

import UIKit

class OpportunitiesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return namaEventOpportunities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = opportunitiesTable.dequeueReusableCell(withIdentifier: "OpportunitiesCell", for: indexPath) as? OpportunitiesTableViewCell
        
        cell?.gambarOpportunitiesCell.image = gambarEventOpportunities[indexPath.row]
        cell?.namaEventOpportunitiesCell.text = namaEventOpportunities[indexPath.row]
        cell?.tanggalEventOpportunitiesCell.text = tanggalEventOpportunities[indexPath.row]
        cell?.neededEventOpportunitiesCell.text = neededEventOpportunities[indexPath.row]
        
        return cell!
    }
    
    var clickedIndex : Int = 0
    
    var namaEventOpportunities : [String] = ["Gempa Lombok","Gempa Jogja"]
    
    var tanggalEventOpportunities : [String] = ["16 Agustus - 16 September","1 Agustus - 20 Agustus"]
    
    var neededEventOpportunities : [String] = ["5 Volunteer Needed","8 Volunter Needed"]
    
    var gambarEventOpportunities : [UIImage] = [
        UIImage(named: "GempaLombok")!,
        UIImage(named: "GempaJogja")!
    ]
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        clickedIndex = indexPath.row
        performSegue(withIdentifier: "DetailOpportunities", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailOpportunitiesViewController{
            

            
            destination.imageGambarDetail = gambarEventOpportunities
            destination.labelTanggalDetail = tanggalEventOpportunities
            destination.index = clickedIndex
            
    
        }
    }
    
    
    @IBOutlet weak var opportunitiesTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}
