//
//  AuthenticationRepository.swift
//  Cuspide
//
//  Created by Hugo Martinez on 21/04/23.
//

import Foundation
final class AuthenticationRepository{
    private let authenticationFirebaseDatasource: AuthenticationFirebaseDatasource
    
    init(authenticationFirebaseDatasource: AuthenticationFirebaseDatasource = AuthenticationFirebaseDatasource()){
        self.authenticationFirebaseDatasource = authenticationFirebaseDatasource
    }
    
    func createNewUser(email: String, password:String, completionBlock: @escaping (Result<User, Error>) -> Void){
        authenticationFirebaseDatasource.createNewUser(email: email, password: password, completionBlock: completionBlock)
    }
    func login(email: String, password:String, completionBlock: @escaping (Result<User, Error>) -> Void){
        authenticationFirebaseDatasource.login(email: email, password: password, completionBlock: completionBlock)
    }

    func getCurrentUser() -> User?{
        authenticationFirebaseDatasource.getCurrentUser()
    }
    func logout() throws{
        try authenticationFirebaseDatasource.logout()
    }
}
