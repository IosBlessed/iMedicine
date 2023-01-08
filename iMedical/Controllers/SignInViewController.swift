//
//  SignInViewController.swift
//  iMedical
//
//  Created by Никита Данилович on 02.01.2023.
//
import Foundation
import UIKit
import FirebaseAuth


class SignInViewController: UIViewController {

    @IBOutlet var backgroundView: BackgroundScreenView!
    
    @IBOutlet weak var credentialsView: UIView!
    
    @IBOutlet var inputFields: [UITextField]!
    
    @IBOutlet var requiredFields: [UILabel]!
    
    @IBOutlet weak var loginField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
        
    var authentication = AuthenticationViewModel()
    
    override func viewDidLoad() {
        
        let mainView = backgroundView.setupBackgroundView()
        backgroundView.addSubview(mainView)
        backgroundView.sendSubviewToBack(mainView)
        backgroundView.addSubview(credentialsView)
        
    }
    
    func loginUser()async{
        
        authentication.email = loginField.text!
        authentication.password = passwordField.text!
        
        guard await authentication.signInWithEmailPassword() else{
            print("Authentication Error: \(authentication.errorMessage)");
            return
        }
       print("Successful authentication")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        if let tabBarVC = storyboard.instantiateViewController(withIdentifier: "tabBarVC") as? TabBarViewController{
            show(tabBarVC, sender: nil)
        }
        
    }
    
    @IBAction func loginButton( sender:RoundButtonView!){
        
        guard self.checkIfFieldsSatisfy(requiredFields: requiredFields, textFields: inputFields) else {
            self.showAlertMessage(alertTitle: "Incorrect Input", alertMessage: "Please, fill in required fields", alertButtonTitle: "Try again")
            return
        }
        Task{
            await loginUser()
        }
    }
    
}
