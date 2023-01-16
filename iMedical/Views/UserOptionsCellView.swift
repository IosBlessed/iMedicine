//
//  UserIOptionsCellView.swift
//  iMedical
//
//  Created by Никита Данилович on 15.01.2023.
//

import UIKit

class UserOptionsCellView: UICollectionViewCell {

    @IBOutlet weak var imageUserCell: UIImageView!
    
    @IBOutlet weak var labelUserCell: UILabel!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
       
    }
    func initializeCell(details:UserSelectorsCellModel){
        
        self.backgroundColor = UIColor.yellow
        self.imageUserCell.image = UIImage(named: details.imageCell)
        self.labelUserCell.text = details.labelCellText
        
        
    }

}
