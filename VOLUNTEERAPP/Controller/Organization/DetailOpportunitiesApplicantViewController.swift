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
    

    @IBOutlet weak var namaOpportunitiesTextField: UITextField!
    
    @IBOutlet weak var waktuOpportunitiesTextField: UITextField!
    
    @IBOutlet weak var lokasiOpportunitiesTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        namaOpportunitiesTextField.text = namaOpportunities[index]
        waktuOpportunitiesTextField.text = waktuOpportunities[index]
        lokasiOpportunitiesTextField.text = lokasiOpportunities[index]
        
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
