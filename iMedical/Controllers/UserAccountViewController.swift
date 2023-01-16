//
//  UserAccountViewController.swift
//  iMedical
//
//  Created by Никита Данилович on 06.01.2023.
//
import Foundation
import FirebaseAuth
import UIKit

class UserAccountViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var userOptionsCollectionView: UICollectionView!
    
    var dataArray:[UserSelectorsCellModel] = [
        UserSelectorsCellModel(imageCell: "company_icon.png", labelCellText: "First Cell"),
        UserSelectorsCellModel(imageCell: "company_icon.png", labelCellText: "Second Cell"),
        UserSelectorsCellModel(imageCell: "company_icon.png", labelCellText: "Third Cell")
    
    ]
    
    override func viewDidLoad() {
       
        initializeNavigationBar()
        
        initializeBackgroundView()
        
        initializeUserCollectionView()
        
    }
    
    func initializeUserCollectionView(){
        
        userOptionsCollectionView.dataSource = self
        userOptionsCollectionView.delegate = self
        userOptionsCollectionView.backgroundColor = .clear
        userOptionsCollectionView.showsHorizontalScrollIndicator = false
        userOptionsCollectionView.isPagingEnabled = false
        userOptionsCollectionView.register(UINib(nibName: "UserOptionsCellView", bundle: nil), forCellWithReuseIdentifier: "userOptionsCell")
        view.addSubview(userOptionsCollectionView)
        userOptionsCollectionView.scrollToItem(at: IndexPath(row: 2, section: 0), at: [], animated: false)
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
 
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Int.max
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let userOption = dataArray[indexPath.row % dataArray.count]
        let cell = userOptionsCollectionView.dequeueReusableCell(withReuseIdentifier: "userOptionsCell", for: indexPath) as! UserOptionsCellView
        cell.initializeCell(details: userOption)
        print("Section -> \(indexPath.section); Row -> \(indexPath.row)")
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 128, height: 128 )
    }
   
}
