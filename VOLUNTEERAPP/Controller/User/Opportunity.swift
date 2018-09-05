//
//  Opportunity.swift
//  VOLUNTEERAPP
//
//  Created by Cason Kang on 04/09/18.
//  Copyright © 2018 Klaudius. All rights reserved.
//

import Foundation

class Opportunity {
    var namaOpportunity:String
    var tanggalMulai:String
    var tanggalSelesai:String
    var tempat:String
    var sar:Int
    var medis:Int
    var dapur:Int
    var UID:String
    
    init(namaOpportunity:String, tanggalMulai:String, tanggalSelesai:String, tempat:String, sar:Int, medis:Int, dapur:Int, UID:String) {
        self.namaOpportunity = namaOpportunity
        self.tanggalMulai = tanggalMulai
        self.tanggalSelesai = tanggalSelesai
        self.tempat = tempat
        self.sar = sar
        self.medis = medis
        self.dapur = dapur
        self.UID = UID
    }
}
