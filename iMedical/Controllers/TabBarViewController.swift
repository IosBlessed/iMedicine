//
//  MainScreenViewController.swift
//  iMedical
//
//  Created by Никита Данилович on 06.01.2023.
//
import Foundation
import UIKit
import FirebaseAuth

class TabBarViewController: UITabBarController {
    
    let mainStoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    
    override func viewDidLoad() {
        
        createTabBarLayer()
        createTabBarItems()
        
    }
    
    func createTabBarLayer(){
        
        let tbLayer = CAShapeLayer()
        let positionX:CGFloat = 50
        let positionY:CGFloat = 5
        let width = tabBar.bounds.width - 2 * positionX
        let height = tabBar.bounds.height + 2 * positionY
        
        let bezierPath = UIBezierPath(
            roundedRect: CGRect(
                x: positionX,
                y: tabBar.bounds.minY - positionY,
                width: width,
                height: height
            ),
            cornerRadius: height/2)
        
        tbLayer.path = bezierPath.cgPath
        tbLayer.fillColor = UIColor(red: 48.0 / 255.0, green: 43.0 / 255.0, blue: 77.0 / 255.0, alpha: 1.0).cgColor
        tbLayer.shadowColor = UIColor(displayP3Red: 0.353, green: 0.757, blue: 0.816, alpha: 1.0).cgColor
        tbLayer.shadowOffset = .zero
        tbLayer.shadowOpacity = 1
        tbLayer.shadowRadius = 10
        
        tabBar.unselectedItemTintColor = UIColor.gray
        //Transparent Tab Bar's layout 
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().shadowImage = UIImage()
        
        tabBar.itemPositioning = .centered
        tabBar.layer.insertSublayer(tbLayer, at: 1)
    }
    
    func createTabBarItems(){
        
        let userAccountVC = mainStoryboard.instantiateViewController(withIdentifier: "userAccVC") as! UserAccountViewController
        let tabletsAccountVC = mainStoryboard.instantiateViewController(withIdentifier: "tabletsVC") as! TabletsViewController
        let userNavVC = UINavigationController(rootViewController: userAccountVC)
        let tabletsNavVC = UINavigationController(rootViewController: tabletsAccountVC)
    viewControllers =  [
        createVC(viewController: userNavVC, title: "", image: UIImage(named:"userIcon.png")!),
        createVC(viewController: tabletsNavVC, title: "", image: UIImage(named: "tablets.png")!)
      ]
    }
    
    func createVC(viewController:UIViewController,title:String,image:UIImage)->UIViewController{
            viewController.tabBarItem.title = title
            viewController.tabBarItem.image = image
        return viewController
    }
  
 
    
  }
  
    


