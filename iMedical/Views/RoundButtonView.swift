//
//  RoundButtonView.swift
//  iMedical
//
//  Created by Никита Данилович on 02.01.2023.
//


import UIKit

@IBDesignable
class RoundButtonView: UIButton {
    
    enum ButtonFlow{
        case next
        case previous
        case unknown
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0{
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0{
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear{
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    func initializeBackgroundView(){
        
        self.borderColor = UIColor(displayP3Red: 0.294, green: 0.608, blue: 0.647, alpha: 0.8)
        self.borderWidth = 2
        self.cornerRadius = 20
        self.tintColor = UIColor(white: 1.0, alpha: 0.8)
        self.backgroundColor = UIColor(red: 48.0 / 255.0, green: 43.0 / 255.0, blue: 77.0 / 255.0, alpha: 1.0)
        self.layer.shadowColor = UIColor(displayP3Red: 0.353, green: 0.757, blue: 0.816, alpha: 0.8).cgColor
        self.layer.shadowRadius = 10
        self.layer.shadowOffset = .zero
        self.layer.shadowOpacity = 1.0
        
    }
    
    func tapSimulator(){
        
        UIView.animate(withDuration: 0.2, animations: {
            self.layer.shadowOpacity = 0.0
        }, completion: {_ in
            self.layer.shadowOpacity = 1.0
        })
        
    }
    
    func changeButtonTitle(title:String){
        self.setAttributedTitle(NSAttributedString(string: title,
                                                   attributes:[
                                                    NSAttributedString.Key.font:UIFont.systemFont(ofSize: 25)
                                                   ]), for: .normal)
    }
}
