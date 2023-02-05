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
    
    private func initializeSectionText(){
        
        let index = cellsCollectionView.cellIndex - 1
        
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
    
    
    private func initializeSectionAnswers(){
        
        let index = cellsCollectionView.cellIndex - 1
        
        
    }
    
    

    // MARK: -> Initial setup
    override func viewDidLoad() {

        super.viewDidLoad()
        
        initializeBackgroundView()
        
        initializeCellsCollectionView()
        
        initializeSectionText()
        
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
        
        collectionView(cellsCollectionView, didSelectItemAt: IndexPath(item: cellsCollectionView.cellIndex, section: 0))
        
        initializeSectionText()
        
    }
    
    @IBAction func selectCell(_ sender: Any) {
        
        nextSettingButton.tapSimulator()
        
        cellsCollectionView.cellStatus = .selected
        
        collectionView(cellsCollectionView, didSelectItemAt: IndexPath(item: cellsCollectionView.cellIndex, section: 0))
        
        cellsCollectionView.cellIndex += 1
        
        initializeSectionText()

    }
    
}
