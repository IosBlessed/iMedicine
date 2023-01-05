//
//  AuthenticationViewModel.swift
//  iMedical
//
//  Created by Никита Данилович on 05.01.2023.
//

import Foundation
import FirebaseAuth
import FirebaseCore


class AuthenticationViewModel: ObservableObject {
    
    enum AuthenticationState{ // To check current state of user
        case unauthenticated
        case authenticating
        case authenticated
    }
    enum AuthenticationFlow{ //User's flow
        case signIn
        case signUp
        
    }
    @Published var email:String = ""
    @Published var password:String = ""
    @Published var confirmPassword:String = ""
    
    @Published var flow:AuthenticationFlow = .signIn
    @Published var authenticationState:AuthenticationState = .unauthenticated
    
    @Published var isValid:Bool = false
    @Published var errorMessage:String = ""
    @Published var displayName:String = ""

    @Published var user: User?
    
    private var authStateHandle: AuthStateDidChangeListenerHandle?
    
    init(){
        registerAuthStateHandler()
    }
    
    
    func registerAuthStateHandler(){
        guard authStateHandle == nil else{return}
        authStateHandle = Auth.auth().addStateDidChangeListener({auth, user in
            self.user = user
            self.authenticationState = user == nil ? .unauthenticated : .authenticated
            self.displayName = user?.email ?? "Unknown user"
        })
    }
    
    
    
    func switchFlow(){
        flow = flow == .signIn ? .signUp : .signIn
    }
    
    
    func reset(){
        flow = .signIn
        email = ""
        password = ""
        confirmPassword = ""
        displayName = ""
    }
}
