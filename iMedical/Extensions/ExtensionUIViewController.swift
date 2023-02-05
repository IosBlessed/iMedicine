//
//  ExtensionGradientColors.swift
//  iMedical
//
//  Created by Никита Данилович on 04.01.2023.
//

import Foundation
import UIKit

extension UIViewController{
    
    func setGradient()->CAGradientLayer{
        
        let colorTop = UIColor(red: 48.0 / 255.0, green: 43.0 / 255.0, blue: 77.0 / 255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 90.0 / 255.0, green: 43.0 / 255.0, blue: 77.0 / 255.0, alpha: 1.0).cgColor
        
        let gradient:CAGradientLayer = {
            let gl = CAGradientLayer()
            gl.frame = view.bounds
                gl.colors = [colorTop, colorBottom]
            gl.locations = [0.0,0.9]
                return gl
        }()
        return gradient
        
    }
   
    func alertSignOut(alertTitle: String,alertMessage:String, exitButtonTitle:String,noButtonTitle:String, handler:@escaping (UIAlertAction) -> Void){
        
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        
        let exitButton = UIAlertAction(title: exitButtonTitle, style: .destructive, handler: handler)
        
        let stayButton = UIAlertAction(title: noButtonTitle, style: .default)
        
        alert.addAction(exitButton)
        alert.addAction(stayButton)
        
        self.present(alert, animated: true)
    }
    
    func alertIncorrectInput(alertTitle: String,alertMessage:String, alertButtonTitle:String){
        
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        let buttonOk = UIAlertAction(title: alertButtonTitle, style: .default)
        alert.addAction(buttonOk)
        self.present(alert, animated: true)
        
    }
    
    func checkIfFieldsSatisfy(requiredFields:[UILabel],textFields:[UITextField])->Bool{
        
        var fieldsNotEmpty = true
        for index in 0..<textFields.count{
            if(!textFields[index].hasText){
                requiredFields[index].isHidden = false
                fieldsNotEmpty = false
            }else{
                requiredFields[index].isHidden = true
            }
        }
        return fieldsNotEmpty

    }
    
}
