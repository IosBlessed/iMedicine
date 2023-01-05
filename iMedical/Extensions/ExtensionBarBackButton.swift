//
//  ExtensionUIImage.swift
//  iMedical
//
//  Created by Никита Данилович on 30.12.2022.
//

import Foundation
import UIKit

extension UIBarButtonItem{
    
    func setBackButtonItem(title:String){
        self.title = title
        self.tintColor = UIColor(displayP3Red: 0.353, green: 0.757, blue: 0.816, alpha: 1.0)
    }
}
