//
//  Cell.swift
//  CollectionView
//
//  Created by Maxim on 05.04.2021.
//

import UIKit

class Cell: UICollectionViewCell {
    

    
    @IBOutlet weak var image: UIImageView!

    
    func setImage(imageName: String){
        image.image = UIImage(named: imageName)
    }
    
}
