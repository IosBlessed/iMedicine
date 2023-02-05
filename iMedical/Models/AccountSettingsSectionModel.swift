//
//  AccounSettingsSectionModel.swift
//  iMedical
//
//  Created by Никита Данилович on 31.01.2023.
//

import Foundation
import UIKit

// MARK: -> Contains whole settings from accountSections.json file
struct AccountSectionsObjects:Decodable{
    
    let settings:[SectionObject]
    
}
// MARK: -> Each object of AccountSectionObjects is below:
struct SectionObject:Decodable{
    
    let id: Int
    let section:String
    let text:String
    let options:[String]?
    let countries:[SectionCountries]?
    
}
// MARK: -> Optional(because only section country has it inside)
struct SectionCountries:Decodable{
    
    let title:String
    let flag:String
    let capital:String
    let population:String
    let cities:[String]
    
}
