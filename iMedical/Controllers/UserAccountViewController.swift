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
    
    override func viewDidLoad() {
        navigationItem.title = "MY ACCOUNT"
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor:UIColor(displayP3Red: 0.353, green: 0.757, blue: 0.816, alpha: 0.8),
            NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 20),
        ]
     
        print("That is user account")
        let gradient = self.setGradient()
        view.layer.insertSublayer(gradient, at: 0)
        
    }
    
    func setupHeaderTitle(){
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
     
    }
    override func viewDidAppear(_ animated: Bool) {
     
    }
    

}
