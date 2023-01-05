//
//  MainScreenViewController.swift
//  iMedical
//
//  Created by Никита Данилович on 05.01.2023.
//

import UIKit

class MainScreenViewController: UIViewController {

    @IBOutlet var backgroundView: BackgroundScreenView!
    
    override func viewDidLoad() {
        
        let gradientLayer = self.setGradient()
        backgroundView.layer.insertSublayer(gradientLayer, at: 0)
        
        
    }
    

 

}
