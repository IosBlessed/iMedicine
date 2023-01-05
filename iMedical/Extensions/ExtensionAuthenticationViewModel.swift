//
//  ExtensionAuthenticationViewModel.swift
//  iMedical
//
//  Created by Никита Данилович on 05.01.2023.
//

import Foundation
import UIKit
import FirebaseAuth


extension AuthenticationViewModel{
    
    func signInWithEmailPassword() async -> Bool{
        authenticationState = .authenticating
        do{
            let authResult = try await Auth.auth().signIn(withEmail: email, password: password)
            user = authResult.user
            authenticationState = .authenticated
            displayName = user?.email ?? "Unknown user"
        }catch{
            print(error)
            errorMessage = error.localizedDescription
            authenticationState = .unauthenticated
        }
        return true
    }
    
    func signUpWithEmailPassword() async -> Bool{
        
        return true
    }
    
    func signOut(){
        
    }
    func deleteAccount()async->Bool{
        return true
    }
}
