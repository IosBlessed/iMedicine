//
//  NewsModel.swift
//  iMedical
//
//  Created by Никита Данилович on 08.01.2023.
//

import Foundation
import UIKit

struct NewsModelStruct{
    var image:UIImage
    var title:String
    var description: String
}

class NewsModel{
    
    var news:[NewsModelStruct] = []
    
    init(){
        setup()
    }
    func setup(){
        let firstNews = NewsModelStruct(image: UIImage(), title: "Ukrain War", description: "Some text about Ukranian war")
        let secondNews = NewsModelStruct(image: UIImage(), title: "Ukrain War", description: "Some text about Ukranian war which is horrible to understand")
        let thirdNews = NewsModelStruct(image: UIImage(), title: "Ukrain War", description: "Some text about Ukranian war")
        news = [firstNews,secondNews,thirdNews]
    }
    
}
