//
//  MainView.swift
//  iMedical
//
//  Created by Никита Данилович on 30.12.2022.
//
import Foundation
import UIKit

class BackgroundScreenView: UIView {
    
    func setBlurEffect()->UIView{
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = super.bounds
        return blurEffectView
    }
    
    func setBackgroundImage(bgImage:UIImage) -> UIImageView{
        let imageViewBackground = UIImageView(frame: super.bounds)
           imageViewBackground.image = bgImage
        
        imageViewBackground.contentMode = .scaleToFill
        return imageViewBackground
    }
    
    func setupBackgroundView()->UIView{
        let mainView = UIView()
        mainView.frame = super.bounds
        let imageView = setBackgroundImage(bgImage: UIImage(named: "main_screen.jpg")!)
        mainView.addSubview(imageView)
        mainView.addSubview(setBlurEffect())
        return mainView
    }
    
}
