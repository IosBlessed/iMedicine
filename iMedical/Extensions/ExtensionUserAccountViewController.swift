//
//  ExtensionUserAccount.swift
//  iMedical
//
//  Created by Никита Данилович on 19.01.2023.
//

import Foundation
import UIKit

extension UserAccountViewController:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    
   private func selectedCellAction(){
       
        let selectedOption = userOptions.selectedOption
        
        switch(selectedOption){
            
            case .signOut:
                processSignOut()
            break;
            case .editAccount:
                processEditAccount()
                break;
            case .medicalCard:
                break;
            default:
                print("No cases of user options selected")
            
        }
       
    }
    
    private func processEditAccount(){
        
        
    }
    
    private func processSignOut(){
         
         self.alertSignOut(
             alertTitle: "Don't say goodbye...",
             alertMessage: "Are you sure that you want to exit?",
             exitButtonTitle: "See you soon!",
             noButtonTitle: "No",
             handler: { _ in
                 // Be carefull, self.user -> instance of class(!!!)
                 let user = self.user
                 
                 guard user.signOut() else {
                     
                     print(user.errorMessage)
                     
                     return
                     
                 }
                 
                 user.resetUserDetails()
                 
                 self.backToStartScreen()
                 
                 
             })
     }
     
     func backToStartScreen(){
         
         let storyboard = UIStoryboard(name: "Main", bundle: nil)
         // Identifier's name => Navigation Controller
         
         let startScreenVC = storyboard.instantiateViewController(withIdentifier: "startScreenNC")
         startScreenVC.modalPresentationStyle = .fullScreen
         present(startScreenVC,animated:true)
         
     }
     
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         
         return cellCarousel
         
     }
     
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         
         let options = userOptions.getUserOptionsList()
         
         let cellOption = options[indexPath.row % options.count]
         
         let cell = userOptionsCollectionView.dequeueReusableCell(withReuseIdentifier: "userOptionsCell", for: indexPath) as! UserOptionsCellView
         
         
         cell.initializeCell(details: cellOption)
         
         guard indexPath.row == cellCarousel - 30 else{
             
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
        
        let selectedCell = options[indexPath.row % options.count]
        
        userOptions.selectedOption = selectedCell.selectedOption
        
        selectedCellAction()
        
        
    }
    
}
