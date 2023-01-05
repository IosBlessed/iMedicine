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
    
    override func viewDidLoad() {

        let mainView = backgroundView.setupBackgroundView()
        backgroundView.addSubview(mainView)
        backgroundView.sendSubviewToBack(mainView)

    }
    
    // func checkIfFieldsNotEmpty, showAlertMessage -> extensions of UIViewController
    @IBAction func createAccountButton(_ sender: RoundButtonView) {
        guard self.checkIfFieldsNotEmpty(requiredFields: requiredFields, textFields: textFields) else {
            self.showAlertMessage(alertTitle: "Incorrect Input", alertMessage: "Please, fill in required fields", alertButtonTitle: "Try again")
            return
        }
        
    }
    
}
