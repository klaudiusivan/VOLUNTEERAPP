//
//  AddOpportunitiesViewController.swift
//  VOLUNTEERAPP
//
//  Created by Klaudius Ivan on 04/09/18.
//  Copyright © 2018 Klaudius. All rights reserved.
//

import UIKit

class AddOpportunitiesViewController: UIViewController {
    
    //MARK : - Var
    var totalVolunteer:Int = 0
    var sarVolunteer : Int = 0
    var medicVolunteer : Int = 0
    var dapurUmumVolunteer : Int = 0
    var namaOpportunities: String = ""
    var datePicker: UIDatePicker?
    
    //MARK: - Outlets
    @IBOutlet weak var SarLabel: UILabel!
    @IBOutlet weak var MedicLabel: UILabel!
    @IBOutlet weak var DapurUmum: UILabel!
    @IBOutlet weak var totalVolunteerLabel: UILabel!
    @IBOutlet weak var tanggalMulai: UITextField!
    //Mark: - Action
    @IBAction func namaOpportunities(_ sender: UITextField) {
        
    }
    
    @IBAction func tanggalMulaiOpportunities(_ sender: UITextField) {
    }
    @IBAction func tanggalSelesaiOpportunities(_ sender: UITextField) {
    }
    
    
    @IBAction func tempatOpportunities(_ sender: Any) {
    }
    
    @IBAction func addMinSarLabel(_ sender: UIStepper) {
        SarLabel.text = String(sender.value)
        sarVolunteer = Int(sender.value)
        counterTotalVolunteer()
    }
    @IBAction func addMinMedicLabel(_ sender: UIStepper) {
        MedicLabel.text = String(sender.value)
        medicVolunteer = Int(sender.value)
        counterTotalVolunteer()
    }
    @IBAction func addMinDapurUmumLabel(_ sender: UIStepper) {
        DapurUmum.text = String(sender.value)
        dapurUmumVolunteer = Int(sender.value)
        counterTotalVolunteer()
    }
    //Mark: - Func
    func counterTotalVolunteer(){
        totalVolunteer =  sarVolunteer + dapurUmumVolunteer + medicVolunteer
        totalVolunteerLabel.text = String(totalVolunteer)
    }
    @objc func dateChanged(datePicker: UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/DD/YYYY"
        tanggalMulai.text = dateFormatter.string(from:datePicker.date)
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(AddOpportunitiesViewController.dateChanged(datePicker: )), for: .valueChanged)
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
