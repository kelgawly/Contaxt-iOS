//
//  SensorData.swift
//  Contaxt
//
//  Created by Alex Waldron on 2/8/22.
//

import Foundation

class SensorData: Codable, Identifiable{
    let id = UUID()
    let fsrResistance: Double
    let accelerometer: Accelerometer
    let gps: GPS
    let timestamp: Date
    let counter: Int
    private enum CodingKeys: String, CodingKey{
        case fsrResistance, accelerometer, gps, timestamp, counter
    }
}

class Accelerometer: Codable{
    let x: Int
    let y: Int
    let z:Int
}
class GPS: Codable{
    let longitude: Double
    let latitude: Double
    let altitude: Double
}
