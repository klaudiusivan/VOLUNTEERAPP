//
//  DetailOpportunitiesViewController.swift
//  VOLUNTEERAPP
//
//  Created by Ivan Riyanto on 04/09/18.
//  Copyright © 2018 Klaudius. All rights reserved.
//

import UIKit

class DetailOpportunitiesViewController: UIViewController,UICollectionViewDataSource {
    var index : Int = 0
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return imageDetail.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = detailCollection.dequeueReusableCell(withReuseIdentifier: "DetailCollection", for: indexPath) as? DetailCollectionViewCell
        
        cell?.skillDetailCell.text = ahliDetail[indexPath.row]
        cell?.gambarDetailCell.image = imageDetail[indexPath.row]
        cell?.jumlahDetailCell.text = totalDetail[indexPath.row]
        
        
        return cell!
    }
    

    
    
    @IBOutlet weak var detailCollection: UICollectionView!
    
    
    var imageGambarDetail: [UIImage] = []
    var opportunities: [Opportunity] = []
    
    @IBOutlet weak var tanggalLbl: UILabel!
    @IBOutlet weak var titleEvent: UILabel!
    @IBOutlet weak var totalVolLable: UILabel!
    @IBOutlet weak var gambarDetail: UIImageView!
    
    
    var ahliDetail : [String] = ["SAR =","Medis =","Dapur ="]
    
    
    var imageDetail : [UIImage] = [
        UIImage(named: "IconSAR")!,
        UIImage(named: "IconMedic")!,
        UIImage(named: "IconDapur")!
    ]
    var totalDetail:[String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        detailCollection.layer.backgroundColor
        var totalVol = opportunities[index].dapur + opportunities[index].medis + opportunities[index].sar
        gambarDetail.image = imageGambarDetail[index]
        titleEvent.text = opportunities[index].namaOpportunity
        tanggalLbl.text = "\(opportunities[index].tanggalMulai)-\(opportunities[index].tanggalSelesai)"
        totalVolLable.text = "\(totalVol) Volunteer/s Needed"
        
        totalDetail = ["\(self.opportunities[index].dapur)","\(self.opportunities[index].medis)","\(self.opportunities[index].sar)"]
   
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
