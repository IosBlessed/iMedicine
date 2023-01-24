//
//  ExtensionUserAccount.swift
//  iMedical
//
//  Created by Никита Данилович on 19.01.2023.
//

import Foundation
import UIKit

extension UserAccountViewController:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
     
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         
         return cellCarousel
         
     }
     
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         
         let options = userOptions.getUserOptionsList()
         
         let cellOption = options[indexPath.row % options.count]
         
         let cell = userOptionsCollectionView.dequeueReusableCell(withReuseIdentifier: "userOptionsCell", for: indexPath) as! UserOptionsCellView
         
         cell.initializeCell(details: cellOption)
         
         guard indexPath.row == cellCarousel - 20 else{
             
             return cell
             
         }
         
         cellCarousel += 100
         userOptionsCollectionView.reloadData()
         
         return cell
         
     }
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         
         return CGSize(width: 100, height: 100 )
         
     }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let options = userOptions.getUserOptionsList()
        print(options[indexPath.row % options.count].selectedOption)
        
    }
}
