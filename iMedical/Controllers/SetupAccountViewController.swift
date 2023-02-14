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
    
    //MARK: - Account Setting Properties
    
    @IBOutlet weak var sectionText: UILabel!
    
    @IBOutlet weak var cellsCollectionView: SetupAccountCollectionView!
    
    @IBOutlet weak var previousSettingButton: RoundButtonView!
    @IBOutlet weak var nextSettingButton: RoundButtonView!
    
    @IBOutlet weak var userInputText: UITextField!
    
    var settings = [SectionObject]()
    
    lazy var answersPickerView:UIPickerView = {
        
        let answerPV = UIPickerView()
        
        answerPV.delegate = self
        answerPV.dataSource = self
        
        view.addSubview(answerPV)
        
        answerPV.translatesAutoresizingMaskIntoConstraints = false
        
        let horizontalConstraint = answerPV.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let verticalConstraint = answerPV.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        
        NSLayoutConstraint.activate([horizontalConstraint,verticalConstraint])
        
        return answerPV
    }()
    
    var pickerVariantsOfAnswer:[String] = []
    
    lazy var userAnswers:[String:String] = [:]
    
    var currentSectionIndex:Int = 0
    
    var currentSection:CurrentSection = .unknown
    
    var userAnswerFlow:UserAnswerFlow = .unknown {
        
        didSet{
            
            if userAnswerFlow == .pickerView{
    
                userInputText.isHidden = true
                
                answersPickerView.isHidden = false
                answersPickerView.reloadComponent(0)
                answersPickerView.selectRow(0, inComponent: 0, animated: false)
                
            }else{
                userInputText.isHidden = false
                userInputText.text = ""
                userInputText.font = UIFont(name: "Times New Roman", size: 20)
                
                answersPickerView.isHidden = true
                
            }
            
        }
        
    }
    
    // MARK: - Setup background view
    private func initializeBackgroundView(){
        // setGragient -> ExtensionUIViewController.swift
        let gradient = self.setGradient()
        
        view.layer.insertSublayer(gradient, at: 0)
        
    }
    
    // MARK: - Setup collection view with account settings section
    private func initializeCellsCollectionView(){
        
        cellsCollectionView.dataSource = self
        cellsCollectionView.delegate = self
        
        settings = cellsCollectionView.initializeSettingsSectionsJSON()
        
        view.addSubview(cellsCollectionView)
        
        cellsCollectionView.setupCustomCollectionView()
    }
    
    //MARK: - Setup Account data flow
    
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
    
   
    private func initializeSectionText(index:Int){
        
        sectionText.text = settings[index].text
        
        sectionText.textColor = UIColor(displayP3Red: 0.353, green: 0.757, blue: 0.816, alpha: 0.9)
        
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
    
    
    private func getUserAnswer(){
        
        switch userAnswerFlow {
        case .pickerView:
            
            let answerIndex = answersPickerView.selectedRow(inComponent: 0)
            let section = settings[currentSectionIndex].section
            let value = pickerVariantsOfAnswer[answerIndex]
            print("\(section) => \(value)")
            userAnswers["\(section)"] = value
            
        case .inputText:
            
            if let userText = userInputText.text{
                
                guard userText != "" && !userText.contains(" ") else{
                    
                    self.alertIncorrectInput(alertTitle: "Wrong data!", alertMessage: "Please, fill in required fields correctly!", alertButtonTitle: "OK")
                    return
                }
                
                
            }else{
                print("Unknown field for input text at SetupAccountViewController.swift")
                return
            }
            
        case .unknown:
            print("System error. Unknown userAnswer flow.")
            //default section
        }
        
        cellsCollectionView.cellIndex += 1
    
        collectionView(cellsCollectionView, didSelectItemAt: IndexPath(item: cellsCollectionView.cellIndex, section: 0))
        
        initializeSettingsSection()
        
            // Verification module of user answer
        print("userAnswerFlow is \(userAnswerFlow)")
        
    }
    
    private func showVariantsAnswers(_ variants:[String]?,_ section:CurrentSection){
        
        switch variants {
        case .some(_):
            if let answers = variants{
                pickerVariantsOfAnswer = answers
                userAnswerFlow = .pickerView
            }
        case .none:
            userAnswerFlow = .inputText
        }
    
    }
    
    private func initializeSectionAnswers(index:Int){
        
        let sectionName = settings[index].section
        
        let section = currentSection.defineCurrentSection(sectionName: sectionName)
        
        currentSectionIndex = index
        
        switch(section){
            
        case .username:
            
            showVariantsAnswers(nil,section)
            
            break;
            
        case .age:
            
            var ageVariants:[String] = []
            
            for age in 10...100{
                ageVariants.append("\(age)")
            }
            
            showVariantsAnswers(ageVariants,section)
            
            break;
            
        case .country:
            
            if let countries = settings[index].countries{
                
                var countriesArray:[String] = []
                
                for country in countries{
                    countriesArray.append("\(country.flag) \(country.title)")
                }
                
                showVariantsAnswers(countriesArray,section)
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
                
                showVariantsAnswers(citiesArray,section)
            }
            
            break;
            
        default:
            
            showVariantsAnswers(settings[index].options,section)
            
        }
         
        
    }
    
    
    private func initializeSettingsSection(){
        
        let index = cellsCollectionView.cellIndex
        
        initializeSectionText(index:index)
        
        initializeSectionAnswers(index: index)
        
    }
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        initializeBackgroundView()
        
        initializeCellsCollectionView()
        
        initializeSettingsSection()
        
        initializeButtonsView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
        
    }
    
    //MARK: - Actionsprint("userAnswerFlow is \(userAnswerFlow)")
    @IBAction func unselectCell(_ sender: Any) {
        
        previousSettingButton.tapSimulator()
        
        cellsCollectionView.cellStatus = .unselected
        
        cellsCollectionView.cellIndex -= 1
        
        collectionView(cellsCollectionView, didSelectItemAt: IndexPath(item: cellsCollectionView.cellIndex + 1, section: 0))
        
        initializeSettingsSection()
        
    }
    
    @IBAction func selectCell(_ sender: Any) {
        
        nextSettingButton.tapSimulator()
        
        cellsCollectionView.cellStatus = .selected
        
        getUserAnswer()

    }
    
}
