//
//  GradientView.swift
//  iMedical
//
//  Created by Никита Данилович on 04.01.2023.
//

import UIKit
import Foundation

class GradientView:UIView {

    func setGradientBackground(colors:[CGColor]){
        let gradient = CAGradientLayer()
        gradient.frame = super.bounds
        gradient.colors = colors
        gradient.cornerRadius = 30
        super.layer.addSublayer(gradient)
    }
    func setShadowOnBackground(){
        
    }

}
