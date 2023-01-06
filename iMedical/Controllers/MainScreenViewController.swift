//
//  MainScreenViewController.swift
//  iMedical
//
//  Created by Никита Данилович on 05.01.2023.
//
import Foundation
import FirebaseAuth
import UIKit
import FirebaseCore
import Combine

class MainScreenViewController: UIViewController {

    @IBOutlet var backgroundView: BackgroundScreenView!
    
    @IBOutlet weak var testText: UILabel!
    
    var login = AuthenticationViewModel()
   
    var name:String!
    
    
    override func viewDidAppear(_ animated: Bool) {
        testText.text = login.displayName
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gradientLayer = self.setGradient()
        backgroundView.layer.insertSublayer(gradientLayer, at: 0)
    }

}
