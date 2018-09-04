//
//  SignUpViewController.swift
//  VOLUNTEERAPP
//
//  Created by Cason Kang on 04/09/18.
//  Copyright © 2018 Klaudius. All rights reserved.
//

import UIKit
import Firebase




class SignUpViewController: UIViewController {

    var skills:[String:String] = [:]
    var ref:DatabaseReference!
    @IBOutlet var skillView: UIView!
    
    @IBOutlet weak var perencanaanOutlet: UIButton!
    @IBOutlet weak var pendidikanOutlet: UIButton!
    @IBOutlet weak var transportasiOutlet: UIButton!
    @IBOutlet weak var logistikOutlet: UIButton!
    @IBOutlet weak var administrasiOutlet: UIButton!
    @IBOutlet weak var kajiCptOutlet: UIButton!
    @IBOutlet weak var geoDanMapOutlet: UIButton!
    @IBOutlet weak var pelatihanDanSimulasiOutlet: UIButton!
    @IBOutlet weak var SAROutlet: UIButton!
    @IBOutlet weak var panganDanNutrisiOutlet: UIButton!
    @IBOutlet weak var dapurUmumOutlet: UIButton!
    @IBOutlet weak var medisOutlet: UIButton!
    @IBOutlet weak var pengungsianDanHuntaraOutlet: UIButton!
    @IBOutlet weak var poskoBencanaOutlet: UIButton!
    @IBOutlet weak var sanitasiOutlet: UIButton!
    @IBOutlet weak var keamananOutlet: UIButton!
    @IBOutlet weak var genderOutlet: UIButton!
    @IBOutlet weak var pemantauanOutlet: UIButton!
    @IBOutlet weak var promosiDanRelawanOutlet: UIButton!
    @IBOutlet weak var psikososialOutlet: UIButton!
    @IBOutlet weak var humasOutlet: UIButton!
    @IBOutlet weak var pertukanganOutlet: UIButton!
    @IBOutlet weak var pertanianOutlet: UIButton!
    @IBOutlet weak var bahasaOutlet: UIButton!
    @IBOutlet weak var kominfoOutlet: UIButton!
    @IBOutlet weak var keuanganOutlet: UIButton!
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    // skill view functions
    @IBAction func medisBtn(_ sender: UIButton) {
        if medisOutlet.isSelected==false {
            medisOutlet.isSelected=true
            skills["13"]="1"
        } else if medisOutlet.isSelected==true{
            medisOutlet.isSelected=false
            skills.removeValue(forKey: "13")
        }
    }
    @IBAction func dapurUmumBtn(_ sender: UIButton) {
        if dapurUmumOutlet.isSelected==false{
            dapurUmumOutlet.isSelected=true
            skills["10"]="1"
        } else if dapurUmumOutlet.isSelected==true{
            dapurUmumOutlet.isSelected=false
            skills.removeValue(forKey: "10")
        }
    }
    @IBAction func sarBtn(_ sender: UIButton) {
        if SAROutlet.isSelected==false{
            SAROutlet.isSelected=true
            skills["6"]="1"
        } else if SAROutlet.isSelected==true{
            SAROutlet.isSelected=false
            skills.removeValue(forKey: "6")
        }
    }
    
    //sign up
    @IBAction func signUpBtn(_ sender: Any) {
        guard let name = nameField.text, name != "" else {
            let alertController = UIAlertController(title: "Eror", message: "Masukkan nama Anda", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
            return
        }
        
        guard let email = emailField.text, name != "" else {
            let alertController = UIAlertController(title: "Eror", message: "Masukkan email Anda", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
            return
        }
        
        guard let password = passwordField.text, name != "" else {
            let alertController = UIAlertController(title: "Eror", message: "Masukkan password Anda", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
            return
        }
        
        if skills==[:] {
            let alertController = UIAlertController(title: "Eror", message: "Masukkan Skill Anda", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if error == nil {
                let createdAccount = Auth.auth().currentUser
                let changeRequest = createdAccount?.createProfileChangeRequest()
                changeRequest?.displayName = name
                changeRequest?.commitChanges(completion: { (error) in
                    if error == nil {
                        let userData = [
                            "verified": 0,
                            "skills": self.skills
                            ] as [String : Any]
                        self.ref.child("users").child((Auth.auth().currentUser?.uid)!).updateChildValues(userData) {
                            (error:Error?, ref:DatabaseReference) in
                            if let error = error {
                                print("Data could not be saved: \(error.localizedDescription).")
                            } else {
                                print("Data saved successfully!")
                            }
                        }
                    } else {
                        let alertController = UIAlertController(title: "Eror", message: error.debugDescription, preferredStyle: .alert)
                        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        alertController.addAction(defaultAction)
                        self.present(alertController, animated: true, completion: nil)
                    }
                })
            }
        }
    }
    
    
    @IBAction func chooseSkillsBtn(_ sender: UIButton) {
        animateIn()
    }
    
    @IBAction func doneSkillsBtn(_ sender: UIButton) {
        animateOut()
        print(skills)
    }
    
    
    func animateIn() {
        self.view.addSubview(skillView)
        skillView.center = self.view.center
        
        skillView.transform = CGAffineTransform.init(scaleX: 1.3, y:1.3)
        skillView.alpha = 0
        UIView.animate(withDuration: 0.4) {
            self.skillView.alpha = 1
            self.skillView.transform = CGAffineTransform.identity
        }
    }
    
    func animateOut() {
        UIView.animate(withDuration: 0.3) {
            self.skillView.transform = CGAffineTransform.init(scaleX: 1.3, y:1.3)
            self.skillView.alpha = 0
        }
        self.skillView.removeFromSuperview()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
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
