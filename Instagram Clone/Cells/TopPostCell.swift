//
//  TopPostCell.swift
//  Instagram Clone
//
//  Created by Suprianto Djamalu on 13/07/19.
//  Copyright © 2019 Suprianto Djamalu. All rights reserved.
//

import Foundation
import UIKit

class TopPostCell: UICollectionViewCell {
    
    private let imgThumbnail = UIImageView(image: UIImage(named: "img_placeholder"))
    
    func build(thumbnail: String){
        setupUI()
        
        imgThumbnail.image = UIImage(named: thumbnail)
    }
    
    private func setupUI(){
     
        // view
        self.addSubview(imgThumbnail)
        
        // imgThumbnail
        imgThumbnail.translatesAutoresizingMaskIntoConstraints = false
        imgThumbnail.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imgThumbnail.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        imgThumbnail.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        imgThumbnail.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 5).isActive = true
        
    }
    
}
