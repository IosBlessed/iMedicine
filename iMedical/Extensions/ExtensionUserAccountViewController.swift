//
//  ExtensionUserAccountViewController.swift
//  iMedical
//
//  Created by Никита Данилович on 08.01.2023.
//

import Foundation
import UIKit
extension UserAccountViewController:UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return news.news.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCell", for: indexPath) as! NewsCell
        cell.setupCell(news: news.news[indexPath.item])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        print("Width of cell: \(collectionView.bounds.width/2 - 20)")
        print("Height of cell: \(collectionView.bounds.height - 10)")
        return CGSize(width: collectionView.bounds.width/2 - 15, height: collectionView.bounds.height - 10)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
}
