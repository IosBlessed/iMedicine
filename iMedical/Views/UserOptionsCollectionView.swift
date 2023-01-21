//
//  UserOptionsCollectionView.swift
//  iMedical
//
//  Created by Никита Данилович on 19.01.2023.
//

import Foundation
import UIKit


class UserOptionsCollectionView:UICollectionView{
    
    func setupCustomCollectionView(){
        
        self.backgroundColor = .clear
        self.showsHorizontalScrollIndicator = false
        self.isPagingEnabled = false
        self.alwaysBounceHorizontal = false
        self.alwaysBounceVertical = false
        
        self.register(
            UINib(nibName: "UserOptionsCellView", bundle: nil),
            forCellWithReuseIdentifier: "userOptionsCell"
        )
        
    }
    
}
