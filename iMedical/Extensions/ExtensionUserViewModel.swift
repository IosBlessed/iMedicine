//
//  ExtensionAuthenticationViewModel.swift
//  iMedical
//
//  Created by Никита Данилович on 05.01.2023.
//

import Foundation
import UIKit
import FirebaseAuth


extension UserModel{
    
    func signInWithEmailPassword() async -> Bool{
        
        authenticationState = .authenticating
        flow = .signIn
        
        do{
            let authResult = try await Auth.auth().signIn(withEmail: email, password: password)
            user = authResult.user
            authenticationState = .authenticated
            displayName = user?.email ?? "Unknown user"
        }catch{
            print("Sign In Error: \(error)")
            errorMessage = error.localizedDescription
            authenticationState = .unauthenticated
            
        }
        return true
        
    }
    
    func signUpWithEmailPassword() async -> Bool{
        
        authenticationState = .authenticating
        flow = .signUp
        
        do{
            guard password == confirmPassword else{
                errorMessage = "Password missmatch"
                authenticationState = .unauthenticated
                return false
            }
            
            let authResult = try await Auth.auth().createUser(withEmail: email, password: password)
            
            user = authResult.user
            authenticationState = .authenticated
            displayName = user?.email ?? "Unknown user"
            
        }catch{
            
            print("Sign Up Error: \(error)")
            errorMessage = error.localizedDescription
            authenticationState = .unauthenticated
            return false
            
        }
        return true
        
    }
    
    func signOut(){
        
    }
    func deleteAccount()async->Bool{
        return true
    }
}