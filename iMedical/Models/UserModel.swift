//
//  AuthenticationViewModel.swift
//  iMedical
//
//  Created by Никита Данилович on 05.01.2023.
//

import Foundation
import FirebaseAuth
import FirebaseCore

class UserModel{
    
    enum AuthenticationState{
        // To check current state of user
        case unauthenticated
        case authenticating
        case authenticated
        
    }
    
    enum AuthenticationFlow{
        //User's flow
        case signIn
        case signUp
        case signOut
        
    }
    
    var email:String = ""
    var password:String = ""
    var confirmPassword:String = ""
    
    var flow:AuthenticationFlow = .signIn
    
    var authenticationState:AuthenticationState = .unauthenticated
    
    var errorMessage:String = ""
    var displayName:String = ""

    var user: User?
    
    private var authStateHandle: AuthStateDidChangeListenerHandle?
    
    init(){
        
        registerAuthStateHandler()
        
    }
    
    func registerAuthStateHandler(){
        // Check if there is any authentication (if != nil, then user authenticated )
        guard authStateHandle == nil else{return}
        authStateHandle = Auth.auth().addStateDidChangeListener({auth, user in
            self.user = user
            self.authenticationState = user == nil ? .unauthenticated : .authenticated
            self.displayName = user?.email ?? "Unknown user"
        })
        
    }
    
    func resetUserDetails(){
        
        flow = .signIn
        email = ""
        password = ""
        confirmPassword = ""
        displayName = ""
        
    }
    
}
