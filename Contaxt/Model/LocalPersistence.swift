//
//  LocalPersistence.swift
//  Contaxt
//
//  Created by Alex Waldron on 2/8/22.
//

import Foundation
struct LocalPersistence{
    static func save(userData: UserData){
        do {
            // Create JSON Encoder
            let encoder = JSONEncoder()

            // Encode Note
            let data = try encoder.encode(userData)

            // Write/Set Data
            UserDefaults.standard.set(data, forKey: K.userDefaultKeys.userData)

        } catch {
            print("Unable to Encode user data (\(error))")
        }
    }
    
    static func getUserData() -> UserData? {
        if let data = UserDefaults.standard.data(forKey: K.userDefaultKeys.userData) {
            
            // Create JSON Decoder
            let decoder = JSONDecoder()
            
            // Decode userData
            return try? decoder.decode(UserData.self, from: data)
            
            
        } else{
            return nil
        }
    }
}
