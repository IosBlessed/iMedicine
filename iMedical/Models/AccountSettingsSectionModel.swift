//
//  AccounSettingsSectionModel.swift
//  iMedical
//
//  Created by Никита Данилович on 31.01.2023.
//

import Foundation
import UIKit

//MARK: - Enums data flow

enum UserAnswerFlow{
    
    case pickerView
    case inputText
    case unknown
    
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

// MARK: - Account JSON Setting Section

struct AccountSectionsObjects:Decodable{
    
    let settings:[SectionObject]
    
}

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

struct SectionCountries:Decodable{
    
    let title:String
    let flag:String
    let capital:String
    let population:String
    
}
