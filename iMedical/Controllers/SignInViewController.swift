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
    
   
    var login = AuthenticationViewModel()
    
    override func viewDidLoad() {
        let mainView = backgroundView.setupBackgroundView()
        backgroundView.addSubview(mainView)
        backgroundView.sendSubviewToBack(mainView)
        backgroundView.addSubview(credentialsView)
        
    }
    func loginUser() async{
        
        login.email = loginField.text!
        login.password = passwordField.text!
        let userExists = await login.signInWithEmailPassword()
        // Here comes Next VC
      
        
    }
    @IBAction func loginButton( sender:RoundButtonView!){
        guard self.checkIfFieldsNotEmpty(requiredFields: requiredFields, textFields: inputFields) else {
            self.showAlertMessage(alertTitle: "Incorrect Input", alertMessage: "Please, fill in required fields", alertButtonTitle: "Try again")
            return
        }
            Task{
               await loginUser()
            }
    
        }
       
        
    }
// .setGradientBackground(colors:[UIColor(displayP3Red: 0.102, green: 0.176, blue: 0.192, alpha: 1.0).cgColor,UIColor(displayP3Red: 0.353, green: 0.757, blue: 0.816, alpha: 1.0).cgColor])
