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
    let cities:[SectionCities]?
    
}

struct SectionCities:Decodable{
    
    let country:String
    let cities:[String]
    
}
// MARK: -> Optional(because only section country has it inside)
struct SectionCountries:Decodable{
    
    let title:String
    let flag:String
    let capital:String
    let population:String
    
}

enum CurrentSection:String{
    
    case unknown = "unknown"
    case username = "username"
    case age = "age"
    case gender = "gender"
    case country = "country"
    case city = "city"
    case bloodType = "bloodType"
    case race = "race"
    case metricSystem = "metricSystem"
    case weight = "weight"
    case height = "height"
    
    func defineCurrentSection(sectionName:String) -> CurrentSection {
        
        var section = CurrentSection.unknown
        
        switch(sectionName){
        case CurrentSection.username.rawValue:
            section = .username
            return section
        case CurrentSection.age.rawValue:
            section = .age
            return section
        case CurrentSection.gender.rawValue:
            section = .gender
            return section
        case CurrentSection.country.rawValue:
            section = .country
            return section
        case CurrentSection.city.rawValue:
            section = .city
            return section
        default:
            return section
            
        }
    }
    
}

