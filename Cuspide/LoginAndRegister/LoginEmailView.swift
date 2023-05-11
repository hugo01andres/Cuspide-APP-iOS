//
//  LoginEmailView.swift
//  Cuspide
//
//  Created by Hugo Martinez on 21/04/23.
//

import SwiftUI


import SwiftUI

struct LoginEmailView: View {
    
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    @State var textFieldEmail: String = ""
    @State var textFieldPassword: String = ""
    
    var body: some View {
        VStack {
            DismissView()
                .padding(.top, 8)
            Group {
                Text(" Iniciar Sesión")
                Text("Cuspide Bienes Raices")
                    .tint(.blue)
                    .bold()
                    .underline()
            }
            .padding(.horizontal, 8)
            .multilineTextAlignment(.center)
            .font(.largeTitle)
            .tint(.blue)
            Image("icon_cuspide-playstore")
                .resizable()
                .frame(width: 200,height: 200)

            Group {
                Text("Ver tus citas")
                    .tint(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.top, 2)
                    .padding(.bottom, 2)
                TextField("Correo electrónico", text: $textFieldEmail)
                TextField("Contraseña", text: $textFieldPassword)
                Button("Login") {
                    authenticationViewModel.login(email: textFieldEmail, password: textFieldPassword)                }
                .padding(.top, 18)
                .buttonStyle(.bordered)
                .tint(.blue)
                if let messageError = authenticationViewModel.messageError {
                    Text(messageError)
                        .bold()
                        .font(.body)
                        .foregroundColor(.red)
                        .padding(.top, 20)
                }
            }
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal, 64)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)  .background(Color.blue.opacity(0.2))                .edgesIgnoringSafeArea(.all)

    }
    
}

struct LoginEmailView_Previews: PreviewProvider {
    static var previews: some View {
        LoginEmailView(authenticationViewModel: AuthenticationViewModel())
    }
}
