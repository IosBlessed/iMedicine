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
    
    private func initializeNavigationalButtons(){
        
        previousSettingButton.initializeBackgroundView()
        
        nextSettingButton.initializeBackgroundView()
        
    }
    
    private func initializeSectionText(index:Int){
        
        sectionText.text = settings[index].text
        
        sectionText.textColor = UIColor(displayP3Red: 0.353, green: 0.757, blue: 0.816, alpha: 0.9)
        
    }
    
    
    private func getUserAnswer() -> Bool{
        
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
                    return false
                }
                
                
            }else{
                print("Unknown field for input text at SetupAccountViewController.swift")
                return false
            }
            
        case .unknown:
            //default section
            print("System error. Unknown userAnswer flow.")
            
            return false
        }
        
            // Verification module of user answer
        print("userAnswerFlow is \(userAnswerFlow)")
        
        return true
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
            
        case .country:
            
            if let countries = settings[index].countries{
                
                var countriesArray:[String] = []
                
                for country in countries{
                    countriesArray.append("\(country.flag) \(country.title)")
                }
                
                showVariantsAnswers(countriesArray,section)
            }
            
            break;
            
        case .weight:
            print("Weight is here")
            if userAnswers["metricSystem"] == "World"{
                var weightWorld:[String] = []
                if let options = settings[index].options{
                    for weight in options{
                        weightWorld.append("\(weight) kg")
                    }
                }
                showVariantsAnswers(weightWorld, section)
            }else{
            // Variant with selection of US metric system 
            }
            
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
        
        switch buttonAction{
            
        case .finish:
            print("finish")
            return
            
        case .next:
            cellsCollectionView.cellIndex += 1
            collectionView(cellsCollectionView, didSelectItemAt: IndexPath(item: cellsCollectionView.cellIndex, section: 0))
            
        case .previous:
            cellsCollectionView.cellIndex -= 1
            collectionView(cellsCollectionView, didSelectItemAt: IndexPath(item: cellsCollectionView.cellIndex + 1, section: 0))
            
        case .unknown:
            print("First setting section")
            
        }
        
        let index = cellsCollectionView.cellIndex
        
        cellsCollectionView.scrollToItem(at: IndexPath(row: index, section: 0), at: .centeredHorizontally, animated: false)
        
        initializeSectionText(index:index)
        
        initializeSectionAnswers(index: index)
        
        switch index{
            
            case 0:
                previousSettingButton.isHidden = true
            case settings.count - 1:
                nextSettingButton.changeButtonTitle(title: "Finish")
            default:
                previousSettingButton.isHidden = false
                nextSettingButton.isHidden = false
                nextSettingButton.changeButtonTitle(title: "Next")
           
        }
        
    }
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        initializeBackgroundView()
        
        initializeCellsCollectionView()
        
        initializeSettingsSection()
        
        initializeNavigationalButtons()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
        
    }
    
    enum ButtonActionFlow{
        case finish
        case next
        case previous
        case unknown
    }
    
    lazy var buttonAction:ButtonActionFlow = .unknown
    
    //MARK: - Actionsprint("userAnswerFlow is \(userAnswerFlow)")
    @IBAction func unselectCell(_ sender: RoundButtonView) {
        
        previousSettingButton.tapSimulator()
        
        cellsCollectionView.cellStatus = .unselected
        
        buttonAction = .previous
        
        initializeSettingsSection()
        
    }
    
    @IBAction func selectCell(_ sender: RoundButtonView) {
        
        nextSettingButton.tapSimulator()
        
        cellsCollectionView.cellStatus = .selected
        
        buttonAction = (cellsCollectionView.cellIndex < settings.count - 1) ? .next : .finish
        
        if getUserAnswer(){
            
            initializeSettingsSection()
            
        }
      
    }
    
}
