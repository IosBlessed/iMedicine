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

class MedicamentViewModel{
    
    private var medicaments = [Medicament]()
    
    private var db = Firestore.firestore()
   
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
                let image = data["image"] as? String ?? "https://firebasestorage.googleapis.com/v0/b/imedical-202cd.appspot.com/o/images%2Fcompany_icon.png?alt=media&token=3c407322-36f9-4cd1-9f22-2583331b1000"
                
                let description = data["description"] as? [String:String] ?? ["Unknown":"Unknown"]
                let symptoms = data["symptoms"] as? [String:String] ?? ["1":"Unknown"]
                let typeOfUsing = data["typeOfUsing"] as? String ?? "drugs"
                
                return Medicament(name: name, manufacture: manufacture, manufactureCountry: manufactureCountry, priceSegment: priceSegment, image: image, description: description, symptoms: symptoms,typeOfUsing: typeOfUsing)
            })
            return completion(self.medicaments)
        }
    }
  
}
