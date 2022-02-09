//
//  RefFanView.swift
//  Contaxt
//
//  Created by Alex Waldron on 2/8/22.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel = LoginViewModel()
    var body: some View {
        
        VStack(spacing:15){
            
            
            
            Picker("Login",selection: $viewModel.userType) {
                Text("Fan").tag(UserType.fan)
                Text("Referee").tag(UserType.ref)
                
            } .pickerStyle(.segmented)
            Group{
                if viewModel.authType == .signUp{
                    TextField("Full Name", text: $viewModel.name, prompt: Text("Full Name"))
                    Divider()
                }
                
                TextField("Email", text: $viewModel.email, prompt: Text("Email"))
                Divider()
                SecureField("Password", text: $viewModel.password, prompt: Text("Password"))
                Divider()
                Spacer().frame(height:50)
                Button {
                    switch viewModel.authType {
                    case .signIn:
                        viewModel.signIn()
                    default:
                        viewModel.signUp()
                    }
                    
                } label: {
                    ButtonView(buttonTitle: viewModel.authType == .signIn ? "Login" : "Sign up", buttonType: .fullWidth)
                }.buttonStyle(.plain)
            }
            HStack{
                Text(viewModel.authType == .signIn ? "Don't have an account?" :"Already have an account?")
                Button {
                    switch viewModel.authType {
                    case .signIn:
                        withAnimation {
                            viewModel.authType = .signUp
                        }
                        
                    case .signUp:
                        withAnimation {
                            viewModel.authType = .signIn
                        }
                        
                    }
                } label: {
                    Text(viewModel.authType == .signIn ? "Create one" :"Login").foregroundColor(.brandColor)
                }.buttonStyle(.plain)
            }
            
            
            
            
            Spacer()
            
            NavigationLink(isActive: $viewModel.authComplete) {
                switch viewModel.userType {
                case .ref:
                    RefHomeView()
                case .fan:
                    FanHomeView()
                }
                
            } label: {
                EmptyView()
            }.buttonStyle(.plain)
            
            
            
            
        }.padding()
            .navigationTitle(viewModel.authType == .signIn ? "Login" : "Sign Up")
            .alert("Error", isPresented: $viewModel.displayError) {
                //dont do anything
            }message: {
                Text(viewModel.errorDescription)
            }
        
        
        
    }
}

struct RefFanView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
