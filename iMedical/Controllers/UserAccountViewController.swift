//
//  UserAccountViewController.swift
//  iMedical
//
//  Created by Никита Данилович on 06.01.2023.
//
import Foundation
import FirebaseAuth
import UIKit

class UserAccountViewController: UIViewController {

  
    @IBOutlet weak var test: UILabel!
    
   // var authentication = AuthenticationViewModel()
    
    override func viewDidLoad() {
        
        test.text = "Nikita"
        
        print("That is user account")
        
        let gradient = self.setGradient()
        view.layer.insertSublayer(gradient, at: 0)
        
    }
  
}
