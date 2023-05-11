//
//  RegisterEmailView.swift
//  Cuspide
//
//  Created by Hugo Martinez on 21/04/23.
//

import SwiftUI

struct RegisterEmailView: View {
    @ObservedObject var authenticationViewModel : AuthenticationViewModel
    @State var textFieldEmail: String = ""
    @State var textFieldPassword: String = ""
    
    var body: some View {
        VStack{
            DismissView()
                .padding(.top, -200)
            Image("icon_cuspide-playstore")
                .resizable()
                .frame(width: 100,height: 100)
            Group {
                    Text("Registrate")
                        .bold()
                        .underline()
            }
            .padding(.horizontal,8)
            .multilineTextAlignment(.center)
            .font(.largeTitle)
            .tint(.primary)
            Group{
                Text("Registrar nueva cuenta")
                    .tint(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.top, 2)
                    .padding(.bottom,2)
                TextField("Correo Electronico: ", text: $textFieldEmail)
                TextField("Password: ", text: $textFieldPassword);
                Button("Create Account"){
                    authenticationViewModel.createNewUser(email: textFieldEmail, password: textFieldPassword)
                }
                .padding(.top, 18)
                .buttonStyle(.bordered)
                .tint(.blue)
                if let messageError = authenticationViewModel.messageError{
                    Text(messageError)
                        .bold()
                        .font(.body)
                        .foregroundColor(.red)
                        .padding(.top,20)
                }
            }
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal, 64)
            }
    }
}

struct RegisterEmailView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterEmailView(authenticationViewModel: AuthenticationViewModel())
    }
}
