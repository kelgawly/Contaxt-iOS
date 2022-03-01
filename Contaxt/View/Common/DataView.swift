//
//  DataView.swift
//  Contaxt
//
//  Created by Alex Waldron on 2/8/22.
//

import SwiftUI

struct DataView: View {
    let sensorData: SensorData
    var body: some View {
        List{
            DataColumn(label: "Timestamp", data: K.dateFormatter.string(from: sensorData.timestamp) )
            DataColumn(label: "Force Sensor Resistance", data: String(sensorData.fsrResistance) )
            DataColumn(label: "X Acceleration", data: String( sensorData.accelerometer.x) )
            DataColumn(label: "Y Acceleration", data: String( sensorData.accelerometer.y) )
            DataColumn(label: "Z Acceleration", data: String( sensorData.accelerometer.z) )
            DataColumn(label: "Longitude", data: String( sensorData.gps.longitude) )
            DataColumn(label: "Latitude", data: String( sensorData.gps.latitude) )
            DataColumn(label: "Altitude", data: String( sensorData.gps.altitude) )
        }.navigationTitle("Reading Info")
    }
}




struct DataColumn: View {
    let label: String
    let data: String
    var body: some View {
        HStack{
            Text(label).frame(maxWidth:.infinity, alignment: .leading)
            
            Text(data).frame(maxWidth:.infinity, alignment: .trailing)
        }
    }
}
