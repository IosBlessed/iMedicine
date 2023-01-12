//
//  TabletsCell.swift
//  iMedical
//
//  Created by Никита Данилович on 09.01.2023.
//
import Foundation
import UIKit

class TabletsCell:UITableViewCell{
    
    @IBOutlet weak var imageMedicament: UIImageView!
    
    @IBOutlet weak var titleMedicament: UILabel!
    
    @IBOutlet weak var helpsFor: UILabel!
    
    @IBOutlet weak var typeMedicament: UILabel!
    
    @IBOutlet weak var price: UILabel!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
      
        let cellBackgroundView = UIView()
        cellBackgroundView.frame = self.bounds
        cellBackgroundView.backgroundColor = .clear
        
        self.layer.cornerRadius = 20
        self.selectedBackgroundView = cellBackgroundView
    }
}
