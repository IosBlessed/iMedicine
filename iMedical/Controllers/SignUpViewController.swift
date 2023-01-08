//
//  SignUpViewController.swift
//  iMedical
//
//  Created by Никита Данилович on 02.01.2023.
//
import Foundation
import UIKit
import Firebase
import FirebaseAuth

class SignUpViewController: UIViewController {

    @IBOutlet var backgroundView: BackgroundScreenView!
    
    @IBOutlet var requiredFields:[UILabel]!
    
    @IBOutlet var textFields:[UITextField]!
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var confirmPasswordField: UITextField!
    var authentication = AuthenticationViewModel()
    
    override func viewDidLoad() {

        let mainView = backgroundView.setupBackgroundView()
        backgroundView.addSubview(mainView)
        backgroundView.sendSubviewToBack(mainView)

    }
    
    func createUserAccount() async {
        
        authentication.email = emailField.text!
        authentication.password = passwordField.text!
        authentication.confirmPassword = confirmPasswordField.text!
        
        guard await authentication.signUpWithEmailPassword() else{ print("Authentication error:\(authentication.errorMessage)");
            return
        }
        print("Account created successfully!")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        if let tabBarVC = storyboard.instantiateViewController(withIdentifier: "tabBarVC") as? TabBarViewController{
            show(tabBarVC, sender: nil)
        }
        
    }
    
    // func checkIfFieldsNotEmpty, showAlertMessage -> extensions of UIViewController
    @IBAction func createAccountButton(_ sender: RoundButtonView) {
        
        guard self.checkIfFieldsSatisfy(requiredFields: requiredFields, textFields: textFields) else {
            self.showAlertMessage(alertTitle: "Incorrect Input", alertMessage: "Please, fill in required fields", alertButtonTitle: "Try again")
            return
        }
        Task{
            await createUserAccount()
        }
        
    }
    
}
