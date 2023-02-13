//
//  SetupAccountCollectionView.swift
//  iMedical
//
//  Created by Никита Данилович on 30.01.2023.
//
import Foundation
import UIKit


class SetupAccountCollectionView: UICollectionView {
// MARK: ExtensionSetupAccountViewController.swift -> flow's logic
    enum CellFlow{
        
        case selected
        case unselected
        
    }
    
    var cellIndex:Int = 0
    
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
    // MARK: Check please AccountSettingsSectionModel ->
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
