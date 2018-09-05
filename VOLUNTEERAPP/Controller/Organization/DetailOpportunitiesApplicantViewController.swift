//
//  OpportunitiesApplicantDetailViewController.swift
//  VOLUNTEERAPP
//
//  Created by Klaudius Ivan on 03/09/18.
//  Copyright © 2018 Klaudius. All rights reserved.
//

import UIKit

class DetailOpportunitiesApplicantViewController: UIViewController {

    var index : Int = 0

    var namaOpportunities : [String] = []
    
    var waktuOpportunities : [String] = []
    
    var lokasiOpportunities : [String] = []
    
    var opportunities: [Opportunity] = []
    
    var navigationBarAppearace = UINavigationBar.appearance()

    @IBOutlet weak var namaOpportunitiesTextField: UITextField!
    
    @IBOutlet weak var waktuOpportunitiesTextField: UITextField!
    
    @IBOutlet weak var lokasiOpportunitiesTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Navigation bar
        navigationBarAppearace.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        navigationBarAppearace.barTintColor = #colorLiteral(red: 0.4980392157, green: 0.768627451, blue: 0.2039215686, alpha: 1)
        
        namaOpportunitiesTextField.text = opportunities[index].namaOpportunity
        waktuOpportunitiesTextField.text = "\(opportunities[index].tanggalMulai) - \(opportunities[index].tanggalSelesai)"
        lokasiOpportunitiesTextField.text = opportunities[index].tempat
        
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
