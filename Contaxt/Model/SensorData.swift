//
//  SensorData.swift
//  Contaxt
//
//  Created by Alex Waldron on 2/8/22.
//

import Foundation

class SensorData: Codable{
    let fsrResistance: Double
    let accelerometer: Accelerometer
    let gps: GPS
    let timeStamp: Date
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
