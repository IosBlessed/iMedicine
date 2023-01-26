//
//  UserAccountViewController.swift
//  iMedical
//
//  Created by Никита Данилович on 06.01.2023.
//
import UIKit
import Foundation
import FirebaseAuth

// Extension -> ExtensionUserAccountViewController.swift
class UserAccountViewController: UIViewController {
    
    @IBOutlet weak var mainContentScrollView: UIScrollView!
    
    @IBOutlet weak var userOptionsCollectionView: UserOptionsCollectionView!
    
    var userOptions = UserOptionsCellModel()
    
    var cellCarousel:Int = 100
    
    var user = UserModel()
    
    
    func initializeNavigationBar(){
        
        navigationItem.title = "MY ACCOUNT"
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor:UIColor(displayP3Red: 0.353, green: 0.757, blue: 0.816, alpha: 0.8),
            NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 20),
        ]
        
    }
    
    func initializeBackgroundView(){
        // setGragient -> ExtensionUIViewController.swift
        let gradient = self.setGradient()
        
        view.layer.insertSublayer(gradient, at: 0)
        
        view.addSubview(mainContentScrollView)
        
    }
    
    func initializeScrollView(){
        
        mainContentScrollView.layer.borderColor = UIColor.green.cgColor
        mainContentScrollView.layer.borderWidth = 2
        mainContentScrollView.layer.cornerRadius = 10
        mainContentScrollView.addSubview(userOptionsCollectionView)
    }
    
    func initializeUserCollectionView(){
        // Whole logic desribed in ExtensionUserAccountViewController.swift 
        userOptionsCollectionView.dataSource = self
        userOptionsCollectionView.delegate = self
    
        userOptionsCollectionView.setupCustomCollectionView()
        
    }
     
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        initializeNavigationBar()
        
        initializeBackgroundView()
        
        initializeScrollView()
        
        initializeUserCollectionView()
        
    }
}
