//
//  HomeView.swift
//  Cuspide
//
//  Created by Hugo Martinez on 24/04/23.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var authenticationViewModel : AuthenticationViewModel
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Bienvenido \(authenticationViewModel.user?.email ?? "No user")").padding(.top,32)
                Spacer()
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Citas")
            .toolbar{
                Button("Logout"){
                    authenticationViewModel.logout()
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(authenticationViewModel: AuthenticationViewModel())
    }
}
