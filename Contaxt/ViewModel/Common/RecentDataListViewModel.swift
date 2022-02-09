//
//  RecentDataListViewModel.swift
//  Contaxt
//
//  Created by Alex Waldron on 2/8/22.
//

import Foundation
class RecentDataListViewModel: ObservableObject{
    @Published var sensorDataPoints: [SensorData]? = nil
    
    init(){
        
    }
}
