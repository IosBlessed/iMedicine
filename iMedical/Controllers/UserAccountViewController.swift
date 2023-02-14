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
    
    @IBOutlet weak var createAccountButton: RoundButtonView!
    
    @IBOutlet weak var userOptionsCollectionView: UserOptionsCollectionView!
    
    var userOptions = UserOptionsCellModel()
    
    var cellCarousel:Int = 100
    
    var user = UserModel()
    
    
    func initializeNavigationBar(){
        
        let backButton = UIBarButtonItem()
        backButton.title = "Menu"
        backButton.tintColor = UIColor(displayP3Red: 0.353, green: 0.757, blue: 0.816, alpha: 0.8)
        
        navigationItem.title = "MY ACCOUNT"
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor:UIColor(displayP3Red: 0.353, green: 0.757, blue: 0.816, alpha: 0.8),
            NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 20),
        ]
        navigationItem.backBarButtonItem = backButton
        
    }
    
    func initializeBackgroundView(){
        // setGragient -> ExtensionUIViewController.swift
        let gradient = self.setGradient()
        
        view.layer.insertSublayer(gradient, at: 0)
        
        view.addSubview(mainContentScrollView)
        
    }
    
    func initializeScrollView(){

        mainContentScrollView.addSubview(userOptionsCollectionView)
    }
    
    func initializeUserCollectionView(){
        // Whole logic described in ExtensionUserAccountViewController.swift
        userOptionsCollectionView.dataSource = self
        userOptionsCollectionView.delegate = self
    
        userOptionsCollectionView.setupCustomCollectionView()
        
    }
     
    
    func checkIfUserAccountEdited(){
        
        createAccountButton.isHidden = true
        createAccountButton.layer.opacity = 0.0
        createAccountButton.initializeBackgroundView()
        
        DispatchQueue.main.async{
            
            self.user.getUserAccount{
                
                userAcc in
                
                let name = userAcc.username
                
                guard name != "Unknown user" else{
                    self.createAccountButton.isHidden = false
                    UIView.animate(withDuration: 1.0, animations: {
                        self.createAccountButton.layer.opacity = 1.0
                    })
                    return
                }
                
            }
        }
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        initializeNavigationBar()
        
        initializeBackgroundView()
        
        initializeScrollView()
        
        initializeUserCollectionView()
        
        checkIfUserAccountEdited()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    @IBAction func editAccount(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let setupAccountVC = storyboard.instantiateViewController(withIdentifier: "setupAccount") as! SetupAccountViewController
        setupAccountVC.navigationItem.title = "SETUP ACCOUNT"
       setupAccountVC.modalPresentationStyle = .fullScreen
        show(setupAccountVC, sender: nil)
       
    }
}
