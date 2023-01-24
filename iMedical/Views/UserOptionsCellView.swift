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
    
   private func setupCellLayer(){
       // Initialization block
       let cellLayer = CAShapeLayer()
       
       cellLayer.frame = self.bounds
       
       cellLayer.backgroundColor = UIColor.white.cgColor
       cellLayer.cornerRadius = 10

       self.layer.insertSublayer(cellLayer, at: 0)
    }
    
    private func setupCellText(){
        
        let textColor = UIColor.black//UIColor(displayP3Red: 0.353, green: 0.757, blue: 0.816, alpha: 1.0)
        
        let textAtributes = [
            NSAttributedString.Key.foregroundColor:textColor,
            NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 13 )
        ]
        
        
        labelUserCell.attributedText = NSAttributedString(string:labelUserCell.text!, attributes:textAtributes)
        
    }
    
    private func setupImgageView(){
        
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
