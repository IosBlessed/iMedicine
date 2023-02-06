//
//  SetupAccountViewController.swift
//  iMedical
//
//  Created by Никита Данилович on 26.01.2023.
//
import Foundation
import UIKit
import SwiftUI

class SetupAccountViewController: UIViewController {
    
    @IBOutlet weak var sectionText: UILabel!
    
    @IBOutlet weak var cellsCollectionView: SetupAccountCollectionView!
    
    @IBOutlet weak var previousSettingButton: RoundButtonView!
    
    @IBOutlet weak var nextSettingButton: RoundButtonView!
    
    var settings = [SectionObject]()
    
    let answersPickerView = UIPickerView()
    
    private var pickerViewState:PickerViewState = .notExists
    //MARK: Variants of answers of each option/country/etc..
    var pickerVariantsOfAnswer:[String] = []
    
    var userAnswers:[String:String] = [:]
    
    var currentSectionIndex:Int = 0
    
    var currentSection:CurrentSection = .unknown
    
    // MARK: -> Setup background view
    private func initializeBackgroundView(){
        // setGragient -> ExtensionUIViewController.swift
        let gradient = self.setGradient()
        
        view.layer.insertSublayer(gradient, at: 0)
        
    }
    
    // MARK: -> Setup collection view with account settings section
    private func initializeCellsCollectionView(){
        
        settings = cellsCollectionView.initializeSettingsSectionsJSON()
        
        view.addSubview(cellsCollectionView)
        
        cellsCollectionView.dataSource = self
        cellsCollectionView.delegate = self
        
        cellsCollectionView.setupCustomCollectionView()
    }
    
    private func initializeButtonsView(){
        
        previousSettingButton.initializeBackgroundView()
        
        nextSettingButton.initializeBackgroundView()
        
    }
    
    private func showSectionTextSwitchDefault(index:Int){
        
        previousSettingButton.isHidden = false
        
        nextSettingButton.isHidden = false
        
        guard index % 2 == 1 else{return}
        
        cellsCollectionView.scrollToItem(at: IndexPath(item: index, section: 0), at: .centeredHorizontally, animated: false)
        
    }
    
    // MARK: Informational text
    private func initializeSectionText(index:Int){
        sectionText.text = settings[index].text
        
        switch(index){
            
            case 0:
                previousSettingButton.isHidden = true
            break;
            
            case settings.count - 1:
                nextSettingButton.isHidden = true
            break;
            
            default:
                showSectionTextSwitchDefault(index: index)
                      
        }
        
    }
    
    // MARK: Custom layout + init of Picker View
    private func initializePickerView(){
        
        answersPickerView.delegate = self
        answersPickerView.dataSource = self
        
        view.addSubview(answersPickerView)
        
        answersPickerView.selectRow(0, inComponent: 0, animated: false)
        
        answersPickerView.translatesAutoresizingMaskIntoConstraints = false
        
        let horizontalConstraint = answersPickerView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let verticalConstraint = answersPickerView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        
        NSLayoutConstraint.activate([horizontalConstraint,verticalConstraint])
        
    }
    
    //MARK: Only PickerView is available for check right now...
    private func getUserAnswerPickerView(){
        
        guard pickerViewState == .exists else {
            return
        }
        let answerIndex = answersPickerView.selectedRow(inComponent: 0)
        let section = settings[currentSectionIndex].section
        let value = pickerVariantsOfAnswer[answerIndex]
        
        print("\(section) => \(value)")
        userAnswers["\(section)"] = value
        
        
    }
    
    private func showVariantsAnswers(variants:[String]?){
        
        if let answers = variants{
            
            pickerViewState = .exists
            
            pickerVariantsOfAnswer = answers
            
            initializePickerView()
            
        }else{
            
            pickerViewState = .notExists
            answersPickerView.removeFromSuperview()
            
        }
        
    }
    
    
    // MARK: -> Section with answers (PickerView/text input)
    private func initializeSectionAnswers(index:Int){
        
        let sectionName = settings[index].section
        
        let section = currentSection.defineCurrentSection(sectionName: sectionName)
        
        currentSectionIndex = index
        
        switch(section){
            
        case .age:
            
            var ageVariants:[String] = []
            
            for age in 10...100{
                ageVariants.append("\(age)")
            }
            showVariantsAnswers(variants: ageVariants)
            
            break;
            
        case .country:
            
            if let countries = settings[index].countries{
                
                var countriesArray:[String] = []
                
                for country in countries{
                    countriesArray.append("\(country.flag) \(country.title)")
                }
                
                showVariantsAnswers(variants: countriesArray)
            }
            
            break;
            
        case .city:
            
            if let cities = settings[index].cities{
                var citiesArray:[String] = []
                for city in cities{
                    
                    if userAnswers["country"]!.contains(city.country){
                        citiesArray = city.cities
                    }
                }
                showVariantsAnswers(variants: citiesArray)
            }
            
            break;
            
        default:
            showVariantsAnswers(variants: settings[index].options)
            
        }
         
        
    }
    
    
    private func initializeSettingsSection(){
        
        let index = cellsCollectionView.cellIndex
        
        initializeSectionText(index:index)
        
        initializeSectionAnswers(index: index)
        
    }
    
    // MARK: -> Initial setup
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        initializeBackgroundView()
        
        initializeCellsCollectionView()
        
        initializeSettingsSection()
        
        initializeButtonsView()
        
    
    }
    
    // MARK: -> Hide Tab Bar from the bottom
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
        
    }
    
    @IBAction func unselectCell(_ sender: Any) {
        
        previousSettingButton.tapSimulator()
        
        cellsCollectionView.cellStatus = .unselected
        
        cellsCollectionView.cellIndex -= 1
        
        // MARK: Just design of deselected cell
        collectionView(cellsCollectionView, didSelectItemAt: IndexPath(item: cellsCollectionView.cellIndex + 1, section: 0))
        
        initializeSettingsSection()
        
    }
    
    @IBAction func selectCell(_ sender: Any) {
        
        nextSettingButton.tapSimulator()
        
        cellsCollectionView.cellStatus = .selected
        
        getUserAnswerPickerView()
        
        cellsCollectionView.cellIndex += 1
        
        //MARK: Just design of selected row
        collectionView(cellsCollectionView, didSelectItemAt: IndexPath(item: cellsCollectionView.cellIndex, section: 0))
        
        initializeSettingsSection()

    }
    
}
