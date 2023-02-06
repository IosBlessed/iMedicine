//
//  Extension+SetupAccountPickerView.swift
//  iMedical
//
//  Created by Никита Данилович on 05.02.2023.
//

import Foundation
import UIKit

extension SetupAccountViewController:UIPickerViewDelegate, UIPickerViewDataSource{
    
    enum PickerViewState{
        
        case exists
        case notExists
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerVariantsOfAnswer.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        
        return pickerVariantsOfAnswer[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let attributedRow = NSAttributedString(string: pickerVariantsOfAnswer[row],attributes: [NSAttributedString.Key.foregroundColor:UIColor(white: 1.0, alpha: 0.8)])
        return attributedRow
    }
    
    
}
