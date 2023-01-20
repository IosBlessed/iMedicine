//
//  UserOptionsCellView.swift
//  iMedical
//
//  Created by Никита Данилович on 15.01.2023.
//

import Foundation
import UIKit

class UserOptionsCellView: UICollectionViewCell {

    @IBOutlet weak var imageUserCell: UIImageView!
    
    @IBOutlet weak var labelUserCell: UILabel!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        
    }
    
    func setupCellLayer(){
        
        self.layer.borderColor = UIColor.red.cgColor
        self.layer.borderWidth = 2
        self.layer.cornerRadius = 10
        
    }
    
    func setupCellText(){
        
        let textAtributes = [
            NSAttributedString.Key.foregroundColor:UIColor.green,
            NSAttributedString.Key.font:UIFont.systemFont(ofSize: 12 )
        ]
        labelUserCell.textColor = UIColor.yellow
        labelUserCell.attributedText = NSAttributedString(string:labelUserCell.text!, attributes:textAtributes)
        
    }
    
    func setupImgageView(){
        
        imageUserCell.frame = CGRect(x: 20, y: 10, width: 60, height: 60)
        imageUserCell.backgroundColor = .clear
        
    }
    
    
    func initializeCell(details:OptionsCellModel){
        
        imageUserCell.image = UIImage(named: details.imageCell)
        labelUserCell.text = details.labelCellText
        
        setupCellLayer()
        setupImgageView()
        setupCellText()
        
        
    }

}
