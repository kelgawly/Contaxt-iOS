//
//  LoginViewModel.swift
//  Contaxt
//
//  Created by Alex Waldron on 2/8/22.
//

import Foundation

import FirebaseFirestoreSwift
import Firebase
class LoginViewModel: ObservableObject{
    @Published var userType: UserType = .fan
    @Published var name:String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var displayError: Bool = false
    @Published var authType: AuthType = .signIn
    let db = Firestore.firestore()
    var errorDescription = ""
    @Published var authComplete = false
    
    func signIn(){
        Auth.auth().signIn(withEmail: email, password: password) { authData, error in
            if let error = error{
                self.errorDescription = error.localizedDescription
                self.displayError = true
            }else if let authData = authData {
                self.db.collection("users").document(authData.user.uid).getDocument{(document, error) in
                    let result = Result {
                          try document?.data(as: UserData.self)
                        }
                        switch result {
                        case .success(let userData):
                            if let userData = userData {
                                // A `userData` value was successfully initialized from the DocumentSnapshot.
                                LocalPersistence.save(userData: userData)
                                self.authComplete = true
                            } else {
                                // A nil value was successfully initialized from the DocumentSnapshot,
                                // or the DocumentSnapshot was nil.
                                print("Document does not exist")
                            }
                        case .failure(let error):
                            // A `City` value could not be initialized from the DocumentSnapshot.
                            print("Error decoding user data: \(error)")
                        }
                }
               
            }
        }
    }
    func signUp(){
        Auth.auth().createUser(withEmail: email, password: password) { authData, error in
            if let error = error{
                self.errorDescription = error.localizedDescription
                self.displayError = true
            }else if let authData = authData {
                do {
                    let userData = UserData(userType: self.userType, name: self.name, firebaseID: authData.user.uid)
                    try self.db.collection("users").document(authData.user.uid).setData(from: userData)
                    LocalPersistence.save(userData: userData)
                    self.authComplete = true
                } catch let error{
                    print("Error setting user document: \(error)")
                }
            }
        }
    }
}
enum AuthType{
    case signIn, signUp
}
