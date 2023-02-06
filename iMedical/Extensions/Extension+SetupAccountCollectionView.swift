//
//  ExtensionSetupAccountViewController.swift
//  iMedical
//
//  Created by Никита Данилович on 30.01.2023.
//

import Foundation
import UIKit

extension SetupAccountViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return settings.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = cellsCollectionView.dequeueReusableCell(withReuseIdentifier: "accountSetting", for: indexPath) as! SetupAccountCellView
        cell.initializeCellView(settingIndex: indexPath.row)
        if indexPath.row == 0{
            selectedCellView(cell: cell)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 40, height: 40)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        
        return true
    }
 
    
    func selectedCellView(cell:SetupAccountCellView){
       
        cell.backgroundColor = UIColor.green
        cell.detailsNumber.layer.opacity = 0.0
        UIView.animate(withDuration: 0.5, animations: {
            
            cell.bounds.size = CGSize(width: 50, height: 50)
            cell.detailsNumber.layer.opacity = 1.0
            
        })
        
    }
    
    func unselectedCellView(cell:SetupAccountCellView){
        
        cell.backgroundColor = UIColor.red
        cell.detailsNumber.layer.opacity = 0.0
        UIView.animate(withDuration: 0.5, animations: {
            
            cell.bounds.size = CGSize(width: 40, height: 40)
            cell.detailsNumber.layer.opacity = 1.0
            
        })
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as? SetupAccountCellView
        guard cell != nil else {
            print("Counter Error! No such cell with the index \(indexPath.row)")
            return
            
        }
        
        switch(cellsCollectionView.cellStatus){
            case .selected:
                selectedCellView(cell: cell!)
                break;
            case .unselected:
                unselectedCellView(cell: cell!)
                break;
            default: break
        }
        
    }
    
    
}
