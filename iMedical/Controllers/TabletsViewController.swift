//
//  TabletsViewController.swift
//  iMedical
//
//  Created by Никита Данилович on 06.01.2023.
//
import Foundation
import UIKit


class TabletsViewController: UIViewController {

    override func viewDidLoad() {
        navigationItem.title = "TABLETS"
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor:UIColor(displayP3Red: 0.353, green: 0.757, blue: 0.816, alpha: 0.8),
            NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 20),
        ]
        let gradient = self.setGradient()
        view.layer.addSublayer(gradient)
        
    }
    

 

}
