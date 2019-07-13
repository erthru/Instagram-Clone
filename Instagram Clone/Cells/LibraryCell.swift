//
//  LibraryCell.swift
//  Instagram Clone
//
//  Created by Suprianto Djamalu on 13/07/19.
//  Copyright © 2019 Suprianto Djamalu. All rights reserved.
//

import Foundation
import UIKit

class LibraryCell: UICollectionViewCell {
    
    private let img = UIImageView(image: UIImage(named: "img_placeholder"))
    
    func build(image: UIImage){
        setupUI()
        
        img.image = image
    }
    
    private func setupUI(){
        
        // view
        self.addSubview(img)
        
        // img
        img.translatesAutoresizingMaskIntoConstraints = false
        img.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        img.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        img.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        img.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
}
