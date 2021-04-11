//
//  ShowImageVC.swift
//  CollectionView
//
//  Created by Maxim on 05.04.2021.
//

import UIKit

class ShowImageVC: UIViewController {
    
    var imageName: String = ""

    @IBOutlet weak var currentImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentImage.image = UIImage(named: imageName)
    }
    
    func setImageName (name: String) {
        imageName = name}
        
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
