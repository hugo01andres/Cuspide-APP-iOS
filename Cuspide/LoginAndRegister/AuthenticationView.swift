//
//  ContentView.swift
//  Cuspide
//
//  Created by Hugo Martinez on 21/04/23.
//

import SwiftUI

enum AuthenticationSheetView: String, Identifiable {
    case register
    case login
    
    var id: String{
        return rawValue
    }
}

struct AuthenticationView: View {
    @ObservedObject var authenticationViewModel : AuthenticationViewModel
    @State private var authenticationSheetView : AuthenticationSheetView?
    
    var body: some View {
        VStack {
            HStack{
                Text("Agenda de citas")
                    .bold()
                    .font(.system(size: 40))
                    .padding(.bottom, 80)
                    .foregroundColor(Color(.blue))
                
            }
            Image("icon_cuspide-playstore")
                .resizable()
                .frame(width: 200,height: 200)
            VStack{
                Button{
                    authenticationSheetView = .login
                } label: {
                    Label("Iniciar Sesion", systemImage: "envelope.fill")
                }
                .tint(.black)
                .controlSize(.large)
                .buttonStyle(.bordered)
                .buttonBorderShape(.capsule)
                .padding(.top,60)
                HStack{
                    Button{
                        authenticationSheetView = .register
                    } label: {
                        Text("Create una cuenta")
                        Text("Registrate")
                            .underline()
                    }
                    .tint(.black)
                    .padding(.top,40)
                }
            }
        }
        .sheet(item: $authenticationSheetView){ sheet in
            switch sheet {
            case .register:
                RegisterEmailView(authenticationViewModel : authenticationViewModel)
            case .login:
                LoginEmailView(authenticationViewModel : authenticationViewModel)
                
            }
        }
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView(authenticationViewModel: AuthenticationViewModel())
    }
}
