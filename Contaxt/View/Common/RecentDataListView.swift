//
//  RecentDataListView.swift
//  Contaxt
//
//  Created by Alex Waldron on 2/8/22.
//

import SwiftUI

struct RecentDataListView: View {
    @StateObject private var viewModel = RecentDataListViewModel()
    var body: some View {
        
        if let sensorDataPoints = viewModel.sensorDataPoints{
        List{
            
            ForEach(sensorDataPoints){ dataPoint in
                NavigationLink {
                    DataView(sensorData: dataPoint)
                } label: {
                    Text(K.dateFormatter.string(from: dataPoint.timestamp))
                }

                
            }
        }.navigationTitle("Recent Readings")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            viewModel.signOut()
                        } label: {
                            Text("Sign Out")
                        }

                    }
                }
        } else{
            ProgressView().navigationTitle("Recent Readings")
        }
        
    }
}

struct RecentDataListView_Previews: PreviewProvider {
    static var previews: some View {
        RecentDataListView()
    }
}
