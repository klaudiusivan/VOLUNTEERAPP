//
//  DetailOpportunitiesViewController.swift
//  VOLUNTEERAPP
//
//  Created by Ivan Riyanto on 04/09/18.
//  Copyright © 2018 Klaudius. All rights reserved.
//

import UIKit
import Firebase

class DetailOpportunitiesViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    var index : Int = 0
    var selectedRole:Int?
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            selectedRole = indexPath.row
        if selectedRole == 0 {
            selectedRoleLbl.text = "Selected Role: Dapur"
        } else if selectedRole == 1 {
            selectedRoleLbl.text = "Selected Role: Medis"
        } else if selectedRole == 2 {
            selectedRoleLbl.text = "Selected Role: SAR"
        }
    }

    @IBAction func joinBtn(_ sender: UIButton) {
        if selectedRole == nil {
            let alertController = UIAlertController(title: "Eror", message: "Pilih Role yang anda mau", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
            return
        }
        
        //disini mskin cek usernya ad skill ato ga klo ga return alert
        
        if selectedRole == 0 {
            opportunities[index].dapur-=1
        } else if selectedRole == 1 {
            opportunities[index].medis-=1
        } else if selectedRole == 2 {
            opportunities[index].sar-=1
        }
        
        let eventData = [
            "namaOpportunity" : opportunities[index].namaOpportunity,
            "tanggalMulai" : opportunities[index].tanggalMulai,
            "tanggalSelesai" : opportunities[index].tanggalSelesai,
            "tempat" : opportunities[index].tempat,
            "sar" : opportunities[index].sar,
            "medis" : opportunities[index].medis,
            "dapur" : opportunities[index].dapur,
            "UID" : opportunities[index].UID
            ] as [String:Any]
        
        ref.child("opportunities").child("\(opportunities[index].UID)").updateChildValues(eventData) {
            (error:Error?, ref:DatabaseReference) in
            if let error = error {
                print("Data could not be saved: \(error.localizedDescription).")
            } else {
                print("Data saved successfully!")
            }
        }
        self.dismiss(animated: true) {
        }
    }
    
    var ref: DatabaseReference!
    @IBOutlet weak var selectedRoleLbl: UILabel!
    @IBOutlet weak var detailCollection: UICollectionView!
    
    
    var imageGambarDetail: [UIImage] = []
    var opportunities: [Opportunity] = []
    
    @IBOutlet weak var tanggalLbl: UILabel!
    @IBOutlet weak var titleEvent: UILabel!
    @IBOutlet weak var totalVolLable: UILabel!
    @IBOutlet weak var gambarDetail: UIImageView!
    @IBOutlet weak var lokasiLbl: UILabel!
    
    
    var ahliDetail : [String] = ["Dapur =","Medis =","Sar ="]
    
    
    var imageDetail : [UIImage] = [
        UIImage(named: "IconDapur")!,
        UIImage(named: "IconMedic")!,
        UIImage(named: "IconSAR")!
    ]
    var totalDetail:[String] = []
    var navigationBarAppearace = UINavigationBar.appearance()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Navigation bar
        navigationBarAppearace.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        navigationBarAppearace.barTintColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        ref = Database.database().reference()
        // detailCollection.layer.backgroundColor
        var totalVol = opportunities[index].dapur + opportunities[index].medis + opportunities[index].sar
        gambarDetail.image = imageGambarDetail[0]
        titleEvent.text = opportunities[index].namaOpportunity
        tanggalLbl.text = "\(opportunities[index].tanggalMulai) - \(opportunities[index].tanggalSelesai)"
        totalVolLable.text = "\(totalVol) Volunteer/s Needed"
        lokasiLbl.text = opportunities[index].tempat
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
