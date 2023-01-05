//
//  loginController.swift
//  iMedical
//
//  Created by Никита Данилович on 30.12.2022.
//
import Foundation
import UIKit

class StartScreenController: UIViewController{


    @IBOutlet weak var startScreen: BackgroundScreenView!
    
    @IBOutlet weak var actionButtonsView: UIView!
    @IBOutlet var actionButtons: [RoundButtonView]!
    @IBOutlet weak var signInButton: RoundButtonView!
    @IBOutlet weak var signUpButton: RoundButtonView!
  
    var firstAppearance:Bool = true
    var mainView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
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
    /*override func viewWillAppear(_ animated: Bool) {
           mainView.center.y -= view.bounds.height
            for btn in actionButtons{
                btn.alpha = 0.0
            }
        }
    override func viewDidAppear(_ animated: Bool) {
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
        }*/
}
