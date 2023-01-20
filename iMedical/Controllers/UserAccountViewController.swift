//
//  UserAccountViewController.swift
//  iMedical
//
//  Created by Никита Данилович on 06.01.2023.
//
import Foundation
import FirebaseAuth
import UIKit

class UserAccountViewController: UIViewController {
    
    @IBOutlet weak var userOptionsCollectionView: UserOptionsCollectionView!
    
     var userOptions = UserOptionsCellModel()
    
     var cellCarousel:Int = 100
    
    override func viewDidLoad() {
        
        initializeNavigationBar()
        
        initializeBackgroundView()
        
        initializeUserCollectionView()
        
    }
    
    func initializeUserCollectionView(){
        
        userOptionsCollectionView.dataSource = self
        userOptionsCollectionView.delegate = self
        
        userOptionsCollectionView.setupCustomCollectionView()
        
        view.addSubview(userOptionsCollectionView)
        
    }
    
    func initializeBackgroundView(){
        
        let gradient = self.setGradient()
        view.layer.insertSublayer(gradient, at: 0)
        
    }
    
    func initializeNavigationBar(){
        
        navigationItem.title = "MY ACCOUNT"
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor:UIColor(displayP3Red: 0.353, green: 0.757, blue: 0.816, alpha: 0.8),
            NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 20),
        ]
        
    }
    
  
   
}
