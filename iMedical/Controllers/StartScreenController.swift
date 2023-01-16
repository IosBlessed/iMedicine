//
//  loginController.swift
//  iMedical
//
//  Created by Никита Данилович on 30.12.2022.
//
import Foundation
import UIKit
import FirebaseAuth

class StartScreenController: UIViewController, UINavigationControllerDelegate{


    @IBOutlet weak var startScreen: BackgroundScreenView!
    
    @IBOutlet weak var actionButtonsView: UIView!
    @IBOutlet var actionButtons: [RoundButtonView]!
    @IBOutlet weak var signInButton: RoundButtonView!
    @IBOutlet weak var signUpButton: RoundButtonView!
  
    var firstAppearance:Bool = true
    var mainView: UIView!
    var user = UserModel()
    
    override func viewDidLoad() {
        print()
        mainView = startScreen.setupBackgroundView()
        view.addSubview(mainView)
        view.addSubview(actionButtonsView)
        performBackgroundAnimation()

    }
    func performBackgroundAnimation(){
        backgroundAnimationStarts()
        backgroundAnimationFinish()
    }
    func backgroundAnimationStarts(){
        mainView.center.y -= view.bounds.height
         for btn in actionButtons{
             btn.alpha = 0.0
         }
    }
    func backgroundAnimationFinish(){
        
        UIView.animate(withDuration: 0.5, animations: {
            self.mainView.center.y += self.view.bounds.height
        })
        var delayTime = 0.5
        for btn in actionButtons{
            UIView.animate(withDuration: 0.5, delay: delayTime, options: .curveEaseIn, animations:{
                btn.alpha = 1.0
            })
            delayTime += 0.5
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.setBackButtonItem(title: "Home")
        navigationItem.backBarButtonItem = backItem
    }
  
    override func viewDidAppear(_ animated: Bool) {
        guard user.authenticationState == .authenticated else{return}
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let tabBarVC = storyboard.instantiateViewController(withIdentifier: "tabBarVC") as? TabBarViewController{
            tabBarVC.modalPresentationStyle = .fullScreen
            present(tabBarVC,animated: false)
        }
    }
}
