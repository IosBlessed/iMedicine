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
    
}
class UserOptionsCellModel{
        
    private var userOptions:[OptionsCellModel] = []
    
    func localSetupOptionsList(){
        
        userOptions.removeAll()
        
        userOptions = [
            OptionsCellModel(idCell: 0, imageCell: "", labelCellText: "Sign Out"),
            OptionsCellModel(idCell: 1, imageCell: "", labelCellText: "Edit account"),
            OptionsCellModel(idCell: 2, imageCell: "", labelCellText: "Medical card")
        ]
        
    }
    
    func getUserOptionsList()->[OptionsCellModel]{
        
        return userOptions
    }
    
    func ServerSetupOptionsList(){
        
        userOptions.removeAll()
        
        
    }
    
}
