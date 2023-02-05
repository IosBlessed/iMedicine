//
//  SetupAccountCellView.swift
//  iMedical
//
//  Created by Никита Данилович on 30.01.2023.
//

import UIKit

class SetupAccountCellView: UICollectionViewCell {

    
    @IBOutlet weak var detailsNumber: UILabel!
    
    
    private func initializeCellLayer(){
        
        self.layer.backgroundColor = UIColor.red.cgColor
        self.layer.cornerRadius = 5.0
        
    }
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        initializeCellLayer()
        
    }
    
    func initializeCellView(settingIndex:Int){
        
        detailsNumber.frame = self.bounds
    
        //detailsNumber.autoresizesSubviews = true
        
        detailsNumber.text = String(settingIndex+1)
        
        detailsNumber.textColor = .black
        
        detailsNumber.textAlignment = .center
        
        detailsNumber.contentMode = .scaleAspectFill
        
    }
 
}
