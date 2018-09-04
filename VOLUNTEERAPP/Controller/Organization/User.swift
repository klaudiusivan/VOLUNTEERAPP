//
//  User.swift
//  VOLUNTEERAPP
//
//  Created by Cason Kang on 04/09/18.
//  Copyright © 2018 Klaudius. All rights reserved.
//

import Foundation

class User {
    var UID:String
    var email:String
    var name:String
    var skills:[String:String]
    var verified:Int
    
    init(UID:String, email:String, name:String, skills:[String:String], verified:Int) {
        self.UID = UID
        self.email = email
        self.name = name
        self.skills = skills
        self.verified = verified
    }
    
}
