//
//  ExtensionTabBar.swift
//  iMedical
//
//  Created by Никита Данилович on 06.01.2023.
//

import Foundation
import UIKit


extension UITabBarController{
    
    func setBackgroundTabBar(){
        
        let tabBarLayer = CALayer()
    
        tabBarLayer.masksToBounds = false
        tabBarLayer.frame = self.view.bounds
        tabBarLayer.cornerRadius = 15
        tabBarLayer.backgroundColor = UIColor(red: 48.0 / 255.0, green: 43.0 / 255.0, blue: 77.0 / 255.0, alpha: 1.0).cgColor
        tabBarLayer.shadowColor = UIColor(displayP3Red: 0.294, green: 0.608, blue: 0.647, alpha: 1.0).cgColor
        tabBarLayer.shadowOpacity = 1.0
        tabBarLayer.shadowOffset = .zero
        tabBarLayer.shadowRadius = 25
        
        tabBarLayer.shouldRasterize = true
        tabBarLayer.rasterizationScale = UIScreen.main.scale
        
        self.tabBar.layer.addSublayer(tabBarLayer)
       
        
     

    }
    
}
