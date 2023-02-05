//
//  SetupAccountCollectionView.swift
//  iMedical
//
//  Created by Никита Данилович on 30.01.2023.
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

class SetupAccountCollectionView: UICollectionView {
// MARK: ExtensionSetupAccountViewController.swift -> flow's logic
    enum CellFlow{
        
        case selected
        case unselected
        
    }
    
    var cellIndex:Int = 1
    
    var cellStatus:CellFlow!
    
    
    func setupCustomCollectionView(){
     // MARK: -> Default settings of Collection View + Cell's registration 
        self.backgroundColor = .clear
        self.showsHorizontalScrollIndicator = false
        self.isPagingEnabled = false
        self.alwaysBounceHorizontal = false
        self.alwaysBounceVertical = false
        
        self.register(UINib(nibName: "SetupAccountCellView", bundle: nil), forCellWithReuseIdentifier: "accountSetting")
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
        
    //MARK: -> Setting up layout( spacing between cells )
        let collectionViewLayout = self.collectionViewLayout as? UICollectionViewFlowLayout
        collectionViewLayout?.scrollDirection = .horizontal
        collectionViewLayout?.sectionInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        collectionViewLayout?.minimumLineSpacing = 20
        collectionViewLayout?.invalidateLayout()
    }
    
    func initializeSettingsSectionsJSON() -> [SectionObject]{
        
        if let jsonPath = Bundle.main.url(forResource: "accountSections", withExtension: "json"){
            
            do{
                let data = try Data(contentsOf: jsonPath)
                let decoder = JSONDecoder()
                
                let settingsObjects = try decoder.decode(AccountSectionsObjects.self, from: data)
                
                return settingsObjects.settings
                
            }catch let error as NSError{
                print("Error: \(error)")
            }
        }else{
            print("Unknown file path to decode!(SetupAccountCollectionView.swift)")
        }
        return []
        
    }
    

}
