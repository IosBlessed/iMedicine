//
//  UserCollectionCellModel.swift
//  iMedical
//
//  Created by Никита Данилович on 16.01.2023.
//

import Foundation

struct OptionsCellModel{
    
    var idCell:Int
    var imageCell:String
    var labelCellText:String
    var selectedOption:SelectedOption
    
}

enum SelectedOption{
    
    case signOut
    case editAccount
    case medicalCard
    case unknown
    
}

class UserOptionsCellModel{
    
        
    var selectedOption:SelectedOption = .unknown
    
    private var userOptions:[OptionsCellModel] = []
    
    
    func localSetupOptionsList(){
        
        userOptions.removeAll()

        userOptions = [
            OptionsCellModel(idCell: 0, imageCell: "signOut.png", labelCellText: "Sign Out",selectedOption: .signOut),
            OptionsCellModel(idCell: 1, imageCell: "editAccount.png", labelCellText: "Edit account",selectedOption: .editAccount),
            OptionsCellModel(idCell: 2, imageCell: "medicalCard.png", labelCellText: "Medical card",selectedOption: .medicalCard)
        ]
        
    }
    
    func getUserOptionsList()->[OptionsCellModel]{
        
        localSetupOptionsList()
        
        return userOptions
    }
    
    func ServerSetupOptionsList(){
        
        userOptions.removeAll()
        
        // Get data from Firebase -> Preferable variant
        
        
    }
    
}
