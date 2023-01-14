//
//  MedicamentModel.swift
//  iMedical
//
//  Created by Никита Данилович on 13.01.2023.
//

import Foundation

struct Medicament:Codable{
    
    var name:String
    var manufacture:String
    var manufactureCountry: String
    var priceSegment:String
    var image: String // here is a link to the image from the Storage
    var description:[String:String]
    var symptoms:[String:String]
    var typeOfUsing:String //Drugs, sirop, injections etc..
    
}
