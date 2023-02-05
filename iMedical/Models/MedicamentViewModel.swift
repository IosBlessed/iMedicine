//
//  MedicamentViewModel.swift
//  iMedical
//
//  Created by Никита Данилович on 12.01.2023.
//

import Foundation
import UIKit
import FirebaseFirestore
import FirebaseDatabase
import FirebaseStorage

struct Medicament{
    
    var name:String
    var manufacture:String
    var manufactureCountry: String
    var priceSegment:String
    var imageLink: String // here is a link to the image from the Storage
    var description:[String:String]
    var symptoms:[String:String]
    var typeOfUsing:String //Drugs, sirop, injections etc..
    
    // Can be used mutating/init instead of setValidData<T>(data:T,defaultValue:T)->T
    init(name: String, manufacture: String, manufactureCountry: String, priceSegment: String, imageLink: String, description: [String : String], symptoms: [String : String], typeOfUsing: String) {
        self.name = name == "" ? "Unknown" : name
        self.manufacture = manufacture == "" ? "Unknown" : manufacture
        self.manufactureCountry = manufactureCountry == "" ? "Unknown" : manufactureCountry
        self.priceSegment = priceSegment == "" ? "Medium" : priceSegment
        self.imageLink = imageLink == "" ? "https://firebasestorage.googleapis.com/v0/b/imedical-202cd.appspot.com/o/images%2Fcompany_icon.png?alt=media&token=3c407322-36f9-4cd1-9f22-2583331b1000" : imageLink
        self.description = description.count == 0 ? ["shortInfo":"Unspecified"] : description
        self.symptoms = symptoms.count == 0 ? ["1":"Unknown"] : symptoms
        self.typeOfUsing = typeOfUsing == "" ? "Drugs" : typeOfUsing
    }
}

class MedicamentViewModel{
    
    private var medicaments = [Medicament]()
    
    private var db = Firestore.firestore()
   
   /*
    private func setValidData<T>(data:T,defaultValue:T)->T{
        
        let defaultValue = defaultValue
        
        if(T.self == [String:String].self){
            
            let info = data as! [String:String]
            
            guard info.count != 0 else {return defaultValue}
            
           return info as! T
            
        }
        if(T.self == String.self){
            
            let info = data as! String
            
            guard info != "" else {return defaultValue}
            
           return info as! T

        }
        
        return defaultValue
    }
    */
    
    func getMedicaments(completion: @escaping([Medicament]?)->Void){
        db.collection("medicaments").getDocuments(){
            querySnapshot, error in
            
            guard error == nil else{
                
                print(error!);
                return completion(nil)
                
            }
            
            guard let documents = querySnapshot?.documents else{
                
                print("No documents found");
                return completion(nil)
                
            }
            
            self.medicaments = documents.map({ QueryDocumentSnapshot -> Medicament in
                
                let data = QueryDocumentSnapshot.data()
                
                let name = data["name"] as? String ?? "Unknown"
                
                let manufacture = data["manufacture"] as? String ?? "Unknown"
                
                let manufactureCountry = data["manufactureCountry"] as? String ?? "Unknown"
                
                let priceSegment = data["priceSegment"] as? String ?? "Medium"
                
                let imageLink = data["image"] as? String ?? "https://firebasestorage.googleapis.com/v0/b/imedical-202cd.appspot.com/o/images%2Fcompany_icon.png?alt=media&token=3c407322-36f9-4cd1-9f22-2583331b1000"
                
                let description = data["description"] as? [String:String] ?? ["shortInfo":"Unspecified"]
                
                let symptoms = data["symptoms"] as? [String:String] ?? ["1":"Unknown"]
                
                let typeOfUsing = data["typeOfUsing"] as? String ?? "Drugs"
                
                
                return Medicament(name: name, manufacture: manufacture, manufactureCountry: manufactureCountry, priceSegment: priceSegment, imageLink: imageLink, description: description, symptoms: symptoms,typeOfUsing: typeOfUsing)
            })
            return completion(self.medicaments)
        }
    }
  
}
