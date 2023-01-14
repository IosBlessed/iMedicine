//
//  TabletsCell.swift
//  iMedical
//
//  Created by Никита Данилович on 09.01.2023.
//
import Foundation
import UIKit
import SDWebImage

class TabletsCellView:UITableViewCell{
    
    @IBOutlet weak var imageMedicament: UIImageView!
    
    @IBOutlet weak var titleMedicament: UILabel!
    
    @IBOutlet weak var helpsFor: UILabel!
    
    @IBOutlet weak var typeMedicament: UILabel!
    
    @IBOutlet weak var shortInfo: UILabel!
    
    @IBOutlet weak var price: UILabel!
    
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        initializeCellLayerView()
        
        initializeSelectedCellLayerView()
        
    }
    
    func initializeCellLayerView(){
        
        // Main Layer of the CellView
        let cellLayer = CALayer()
        cellLayer.frame = super.bounds
        cellLayer.backgroundColor = UIColor(red: 48.0 / 255.0, green: 43.0 / 255.0, blue: 77.0 / 255.0, alpha: 1.0).cgColor
        cellLayer.cornerRadius = 10
        
        // Shadow of Cell Layer
        cellLayer.shadowColor = UIColor(displayP3Red: 0.353, green: 0.757, blue: 0.816, alpha: 1.0).cgColor
        cellLayer.shadowOffset = .zero
        cellLayer.shadowOpacity = 1
        cellLayer.shadowRadius = 2
        
        // Margins for the Cell's frame
        cellLayer.frame  = cellLayer.frame.inset(by: UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 10))
        
        //( *IMPORTANT* ) Using of SUPERCALSS may be cause of next-inheritance inconsistencies.
        super.backgroundColor = UIColor.clear
        self.layer.insertSublayer(cellLayer, at: 0)
       
    }
    
    func initializeSelectedCellLayerView() {
        
        // Custom view for selected row in a TableView
        
        let cellBackgroundView = UIView()
        cellBackgroundView.frame = self.bounds
        cellBackgroundView.backgroundColor = .clear
        self.selectedBackgroundView = cellBackgroundView
        
    }
    
    private let priceColor = { (medicament:Medicament) -> UIColor in
        
        let priceSegment = medicament.priceSegment
        
        let textColor:UIColor
        
        switch(priceSegment){
            case "Low":
                textColor = UIColor.green
                break;
            case "Medium":
                textColor = UIColor.yellow
                break;
            case "High":
                textColor = UIColor.red
                break;
            default:
                textColor = UIColor.yellow
        }
        
        return textColor
        
    }
    
    private func setupCustomStyle(medicament:Medicament){

        imageMedicament.layer.cornerRadius = 10
        
        // setup text color for price segments(Low/Medium/High)
        price.textColor = priceColor(medicament)
        price.highlightedTextColor = price.textColor
        
    }

    private let randSymptom = {(medicament:Medicament) -> String in
        var symptom = ""
        let symptomsCount = medicament.symptoms.count
        symptom = medicament.symptoms["\(Int.random(in: 1...symptomsCount))"] ?? "Unknown"
        
        return symptom
    }
    func initalizeCell(medicament:Medicament){
        
        setupCustomStyle(medicament: medicament)
        
        imageMedicament.sd_setImage(with: URL(string: medicament.image))
        titleMedicament.text = medicament.name
        helpsFor.text = randSymptom(medicament)
        typeMedicament.text = medicament.typeOfUsing
        shortInfo.text = medicament.description["shortInfo"]
        price.text = medicament.priceSegment
        
    }
    
}
