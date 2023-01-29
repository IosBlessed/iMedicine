//
//  SetupAccountViewController.swift
//  iMedical
//
//  Created by Никита Данилович on 26.01.2023.
//

import UIKit

class SetupAccountViewController: UIViewController {

    private func initializeNavigationBar(){
        navigationItem.title = "Setup Account"
    }
    
    
    private func initializeBackgroundView(){
        // setGragient -> ExtensionUIViewController.swift
        let gradient = self.setGradient()
        
        view.layer.insertSublayer(gradient, at: 0)
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        initializeNavigationBar()
        
        initializeBackgroundView()
    
    }


}
