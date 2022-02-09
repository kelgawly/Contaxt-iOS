//
//  ContentViewModek.swift
//  Contaxt
//
//  Created by Alex Waldron on 2/8/22.
//

import Foundation
import FirebaseAuth
class ContentViewModel: ObservableObject{
    @Published var user: User? = Auth.auth().currentUser
    var userType: UserType?
    init(){
        Auth.auth().addStateDidChangeListener { auth, user in
            self.user = user
        }
        let userData = LocalPersistence.getUserData()
        self.userType = (userData != nil ? UserType(rawValue: userData!.userType) : nil)
    }
}
