//
//  ContentView.swift
//  Contaxt
//
//  Created by Alex Waldron on 2/8/22.
//

import SwiftUI
import FirebaseAuth
struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    var body: some View {
        NavigationView{
        if (viewModel.user != nil) && (viewModel.userType != nil) {
            switch viewModel.userType!{
            case .fan:
                //show fan view for signed in user
                FanHomeView()
                
            case .ref:
                //show ref view for signed in user
                RefHomeView()
            }
        } else{
            //go to ref or fan selection
            LoginView()
            
        }
        }
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
