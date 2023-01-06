//
//  MainScreenViewController.swift
//  iMedical
//
//  Created by Никита Данилович on 06.01.2023.
//
import Foundation
import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    enum TabBarItems{
        case account
        case tablets
        case history
    }
    
    override func viewDidLoad() {
        self.setBackgroundTabBar()
        self.delegate = self
        initializeTabBar()
        
    }
    
    func initializeTabBar(){
        let accountVC = UserAccountViewController()
        let tabletsVC = TabletsViewController()
    
        //item's section
        let accountTabBarItem  = UITabBarItem(title: "Me", image: .none, tag: 0)
        let tabletsTabBarItem = UITabBarItem(title: "Tablets", image: .none, tag: 1)
        
        accountVC.tabBarItem = accountTabBarItem
        tabletsVC.tabBarItem = tabletsTabBarItem
        
      
        self.setViewControllers([accountVC,tabletsVC], animated: true)
    }

      
      func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
      }
  }
  
    


