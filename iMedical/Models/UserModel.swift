//
//  AuthenticationViewModel.swift
//  iMedical
//
//  Created by Никита Данилович on 05.01.2023.
//

import Foundation
import FirebaseAuth
import FirebaseStorage
import FirebaseFirestore
import FirebaseDatabase

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
    
    struct UserAccount{
        
        var username:String
        var age:Int
        var metricSystem:String
        var country:String
        var city:String
        var bloodType:String
        var race:String
        var gender:String
        var email:String
        var weight:Float
        
        init(
            username:String,
            age:Int,
            metricSystem:String,
            country:String,
            city:String,
            bloodType:String,
            race:String,
            gender:String,
            email:String,
            weight:Float){
                
                self.username = username == "" ? "Unknown user" : username
                
                self.age = age <= 0 ? 0 : age
                
                self.metricSystem = metricSystem == "" ? "world" : metricSystem
                
                self.country = country == "" ? "Unknown country" : country
                
                self.city = city == "" ? "Unknown city" : city
                
                self.bloodType = bloodType == "" ? "Unknown blood type" : bloodType
                
                self.race = race == "" ? "Unknown race" : race
                
                self.gender = gender == "" ? "Unknown gender" : gender
                
                self.email = email == "" ? "Unknown email" : email
                
                self.weight = weight <= 0.0 ? 0.0 : weight
                
        }
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
    
    func getUserAccount(completion:@escaping (UserAccount) -> Void){
        
        let db = Firestore.firestore()
        
        guard self.user != nil else{
            print("Current user is not authenticated!")
            return
        }
        db.collection("userAccounts").document(self.user!.uid).addSnapshotListener(){
            (DocumentSnapshot,error) in

            guard error == nil else{
                
                print(error!.localizedDescription)
                return
                
            }
            
            guard let user = DocumentSnapshot!.data() else {
                
                print("Invalid reference of userAccounts collection!")
                return
                
                
            }
                
                let email = user["email"] as? String ?? "Unknown email data type"
                
                let username = user["username"] as? String ?? "Unknown username data type"
                
                let age = user["age"] as? Int ?? 0
                
                let bloodType = user["bloodType"] as? String ?? "Unknown blood data type"
                
                let city = user["city"] as? String ?? "Unknown city data type"
                
                let country = user["country"] as? String ?? "Unknown country data type"
                
                let gender = user["gender"] as? String ?? "Unknown gender data type"
                
                let metricSystem = user["metricSystem"] as? String ?? "Unknown metricSystem data type"
                
                let race = user["race"] as? String ?? "Unknown race data type"
                
                let weight = user["weight"] as? Float ?? 0.0
                
                completion(UserAccount(username: username, age: age, metricSystem: metricSystem, country: country, city: city, bloodType: bloodType, race: race, gender: gender, email: email, weight: weight))
         
        }
        
        }
    
    func resetUserDetails(){
        
        flow = .signIn
        email = ""
        password = ""
        confirmPassword = ""
        displayName = ""
        
    }
    
}
