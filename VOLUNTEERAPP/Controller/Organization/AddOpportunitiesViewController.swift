//
//  AddOpportunitiesViewController.swift
//  VOLUNTEERAPP
//
//  Created by Klaudius Ivan on 04/09/18.
//  Copyright © 2018 Klaudius. All rights reserved.
//

import UIKit
import Firebase

class AddOpportunitiesViewController: UIViewController, UITextFieldDelegate, UIGestureRecognizerDelegate {
    
    //MARK : - Var
    var totalVolunteer:Int = 0
    var sarVolunteer : Int = 0
    var medicVolunteer : Int = 0
    var dapurUmumVolunteer : Int = 0
    var namaOpportunities: String = ""
    var datePicker = UIDatePicker()
    var datePicker2 = UIDatePicker()
    var ref:DatabaseReference!
    
    //MARK: - Outlets
    @IBOutlet weak var SarLabel: UILabel!
    @IBOutlet weak var MedicLabel: UILabel!
    @IBOutlet weak var DapurUmum: UILabel!
    @IBOutlet weak var totalVolunteerLabel: UILabel!
    @IBOutlet weak var tanggalMulai: UITextField!
    @IBOutlet weak var tanggalSelesai: UITextField!
    @IBOutlet weak var opportunityField: UITextField!
    @IBOutlet weak var tempatField: UITextField!
    
    
    //Mark: - Action
    
    @IBAction func kembaliBtn(_ sender: UIButton) {
        self.dismiss(animated: true) {
            
        }
    }
    
    
    @IBAction func submitOpportunity(_ sender: UIButton) {
        guard let opportunity = opportunityField.text, opportunity != "" else {
            let alertController = UIAlertController(title: "Eror", message: "Masukkan nama Volunteering Opportunity", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
            return
        }
        guard let tanggalMulai = tanggalMulai.text, tanggalMulai != "" else {
            let alertController = UIAlertController(title: "Eror", message: "Masukkan Tanggal Mulai", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
            return
        }
        guard let tanggalSelesai = tanggalSelesai.text, tanggalSelesai != "" else {
            let alertController = UIAlertController(title: "Eror", message: "Masukkan tanggal selesai", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
            return
        }
        guard let tempat = tempatField.text, tempat != "" else {
            let alertController = UIAlertController(title: "Eror", message: "Masukkan nama Tempat", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
            return
        }
        guard let totalVol:Int = totalVolunteer, totalVol != 0 else {
            let alertController = UIAlertController(title: "Eror", message: "Jumlah Volunteer tidak boleh 0", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
            return
        }
        let eventData = [
            "namaOpportunity" : opportunity,
            "tanggalMulai" : tanggalMulai,
            "tanggalSelesai" : tanggalSelesai,
            "tempat" : tempat,
            "sar" : sarVolunteer,
            "medis" : medicVolunteer,
            "dapur" : dapurUmumVolunteer,
            "UID" : UUID().uuidString
        ] as [String:Any]
        ref.child("opportunities").child("\(eventData["UID"]!)").updateChildValues(eventData) {
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
    
    
    @IBAction func addMinSarLabel(_ sender: UIStepper) {
        SarLabel.text = String(Int(sender.value))
        sarVolunteer = Int(sender.value)
        counterTotalVolunteer()
    }
    @IBAction func addMinMedicLabel(_ sender: UIStepper) {
        MedicLabel.text = String(Int(sender.value))
        medicVolunteer = Int(sender.value)
        counterTotalVolunteer()
    }
    @IBAction func addMinDapurUmumLabel(_ sender: UIStepper) {
        DapurUmum.text = String(Int(sender.value))
        dapurUmumVolunteer = Int(sender.value)
        counterTotalVolunteer()
    }
    //Mark: - Func
    func counterTotalVolunteer(){
        totalVolunteer =  sarVolunteer + dapurUmumVolunteer + medicVolunteer
        totalVolunteerLabel.text = String(Int(totalVolunteer))
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        createDatePicker()
        createDatePicker2()
        
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
        self.opportunityField.delegate = self
        self.tempatField.delegate = self
        self.tanggalSelesai.delegate = self
        self.tanggalMulai.delegate = self
        
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self as! UIGestureRecognizerDelegate
        
        
        // Do any additional setup after loading the view.
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
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

extension AddOpportunitiesViewController {
    
    func createDatePicker() {
        
        // Formatting the date picker type
        datePicker.datePickerMode = .date
        datePicker.locale = Locale(identifier: "id")
        
        // Create Toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(AddOpportunitiesViewController.dismissDatePicker))
        doneButton.tintColor = UIColor.init(displayP3Red: 75/255, green: 154/255, blue: 212/255, alpha: 1.0)
        doneButton.setTitleTextAttributes([NSAttributedStringKey.font : UIFont(name: "AvenirNext-Medium", size: 16.0)!], for: .normal)
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        toolbar.items = [flexibleSpace, doneButton]
        
        tanggalMulai.inputAccessoryView = toolbar
        tanggalMulai.inputView = datePicker
    }
    
    // Used for Date Picker Done button
    @objc func dismissDatePicker() {
        // Format Date
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy" // dd-MM-yyyy
        formatter.locale = Locale(identifier: "id")
        //dob = formatter.string(from: datePicker.date)
        formatter.dateFormat = "dd-MM-yyyy"
        //let dateConvert = formatter.date(from: dob!)
        formatter.dateFormat = "dd MMMM yyyy"
        let dateDisplay = formatter.string(from: datePicker.date)
        
        tanggalMulai.text = String(dateDisplay)
        view.endEditing(true)
    }
    
    func createDatePicker2() {
        
        // Formatting the date picker type
        datePicker2.datePickerMode = .date
        datePicker2.locale = Locale(identifier: "id")
        
        // Create Toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(AddOpportunitiesViewController.dismissDatePicker2))
        doneButton.tintColor = UIColor.init(displayP3Red: 75/255, green: 154/255, blue: 212/255, alpha: 1.0)
        doneButton.setTitleTextAttributes([NSAttributedStringKey.font : UIFont(name: "AvenirNext-Medium", size: 16.0)!], for: .normal)
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        toolbar.items = [flexibleSpace, doneButton]
        
        tanggalSelesai.inputAccessoryView = toolbar
        tanggalSelesai.inputView = datePicker2
    }
    
    // Used for Date Picker Done button
    @objc func dismissDatePicker2() {
        // Format Date
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy" // dd-MM-yyyy
        formatter.locale = Locale(identifier: "id")
        //dob = formatter.string(from: datePicker.date)
        formatter.dateFormat = "dd-MM-yyyy"
        //let dateConvert = formatter.date(from: dob!)
        formatter.dateFormat = "dd MMMM yyyy"
        let dateDisplay = formatter.string(from: datePicker2.date)
        
        tanggalSelesai.text = String(dateDisplay)
        view.endEditing(true)
    }
}
