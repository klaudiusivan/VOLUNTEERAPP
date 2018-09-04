//
//  InitialViewController.swift
//  VOLUNTEERAPP
//
//  Created by Cason Kang on 03/09/18.
//  Copyright © 2018 Klaudius. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class InitialViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBAction func loginBtn(_ sender: UIButton) {
        guard let email = usernameField.text, email != "" else {
            let alertController = UIAlertController(title: "Eror", message: "Masukkan email Anda", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
            return
        }
        
        guard let password = passwordField.text, password != "" else {
            let alertController = UIAlertController(title: "Eror", message: "Masukkan kata sandi Anda", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            if error != nil {
                let errorCode = error! as NSError
                var errorMessage = String()
                
                switch errorCode.code{
                case AuthErrorCode.invalidEmail.rawValue:
                    errorMessage = "Format email tidak tepat"
                case AuthErrorCode.wrongPassword.rawValue:
                    errorMessage = "Kata sandi tidak tepat"
                case AuthErrorCode.userNotFound.rawValue:
                    errorMessage = "Akun Anda tidak valid"
                case AuthErrorCode.userDisabled.rawValue:
                    errorMessage = "Akun Anda telah diblokir"
                case AuthErrorCode.networkError.rawValue:
                    errorMessage = "Internet Anda sedang mengalami gangguan"
                case AuthErrorCode.userTokenExpired.rawValue:
                    errorMessage = "Telah terjadi perubahan pada akun Anda. Tolong masuk kembali ke akun Anda"
                case AuthErrorCode.tooManyRequests.rawValue:
                    errorMessage = "Data server sedang mengalami masalah. Silakan coba lagi beberapa saat"
                default:
                    errorMessage = error.debugDescription
                }
                
                let alertController = UIAlertController(title: "Eror", message: errorMessage, preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                self.present(alertController, animated: true, completion: nil)
            }
        }
        
    }
    
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
