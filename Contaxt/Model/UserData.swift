//
//  UserData.swift
//  Contaxt
//
//  Created by Alex Waldron on 2/8/22.
//

import Foundation
class UserData:Codable{
    var userType:String
    var name: String
    var firebaseID: String
    init(userType: UserType, name:String, firebaseID: String){
        self.userType = userType.rawValue
        self.name = name
        self.firebaseID = firebaseID
    }
}
