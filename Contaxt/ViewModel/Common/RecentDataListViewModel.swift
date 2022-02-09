//
//  RecentDataListViewModel.swift
//  Contaxt
//
//  Created by Alex Waldron on 2/8/22.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
class RecentDataListViewModel: ObservableObject{
    @Published var sensorDataPoints: [SensorData]? = nil
    let db = Firestore.firestore()
    init(){
        db.collection("hardware").document("deviceReadings").collection("F4:CF:A2:D0:39:D9").order(by: "timestamp", descending: true).order(by: "counter", descending: true).limit(to: 50).addSnapshotListener{ querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                       print("Error fetching documents: \(error!)")
                       return
                   }
            self.sensorDataPoints = documents.map({ document in
                try! document.data(as: SensorData.self)!
            })
            
                   
            
        }
    }
}
