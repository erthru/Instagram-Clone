//
//  StoryCell.swift
//  Instagram Clone
//
//  Created by Suprianto Djamalu on 13/07/19.
//  Copyright © 2019 Suprianto Djamalu. All rights reserved.
//

import Foundation
import UIKit

class StoryCell: UICollectionViewCell{
    
    private let imgAvatar = UIImageView(image: UIImage(named: "img_placeholder"))
    private let lbName = UILabel()
    
    func build(story: Story){
        setupUI()
        
        lbName.text = story.username.lowercased()
        imgAvatar.image = UIImage(named: story.avatar)
        
        if story.id == 1 {
            imgAvatar.layer.borderColor = (UIColor.gray).cgColor
        }
    }
    
    private func setupUI(){
        
        // view
        self.addSubview(imgAvatar)
        self.addSubview(lbName)
        
        // imgAvatar
        imgAvatar.translatesAutoresizingMaskIntoConstraints = false
        imgAvatar.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imgAvatar.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        imgAvatar.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        imgAvatar.heightAnchor.constraint(equalToConstant: 60).isActive = true
        imgAvatar.layer.masksToBounds = true
        imgAvatar.layer.cornerRadius = 60/2
        imgAvatar.layer.borderColor = (UIColor.red).cgColor
        imgAvatar.layer.borderWidth = 2
        
        // lbname
        lbName.translatesAutoresizingMaskIntoConstraints = false
        lbName.topAnchor.constraint(equalTo: imgAvatar.bottomAnchor, constant: 8).isActive = true
        lbName.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        lbName.text = "user"
        lbName.font = UIFont.systemFont(ofSize: 12)
        lbName.numberOfLines = 1
    }
    
}
