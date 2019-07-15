//
//  FollowingCell.swift
//  Instagram Clone
//
//  Created by Suprianto Djamalu on 15/07/19.
//  Copyright © 2019 Suprianto Djamalu. All rights reserved.
//

import Foundation
import UIKit

class FollowingCell: UITableViewCell {
    
    private let imgAvatar = UIImageView(image: UIImage(named: "img_placeholder"))
    private let lbDesc = UILabel()
    private let btnFollow = UIButton(type: .system)
    
    func build(index: Int){
        setupUI()
        
        lbDesc.attributedText = StringCheck.attributedText(withString: " started following you", boldString: "creepyUser \(index)")
    }
    
    
    
    private func setupUI(){
        
        // view
        self.addSubview(imgAvatar)
        self.addSubview(lbDesc)
        self.addSubview(btnFollow)
        
        // imgAvatar
        imgAvatar.translatesAutoresizingMaskIntoConstraints = false
        imgAvatar.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        imgAvatar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        imgAvatar.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16).isActive = true
        imgAvatar.heightAnchor.constraint(equalToConstant: 56).isActive = true
        imgAvatar.widthAnchor.constraint(equalToConstant: 56).isActive = true
        imgAvatar.layer.masksToBounds = true
        imgAvatar.layer.cornerRadius = 56 / 2
     
        // lbDesc
        lbDesc.translatesAutoresizingMaskIntoConstraints = false
        lbDesc.topAnchor.constraint(equalTo: self.topAnchor, constant: 24).isActive = true
        lbDesc.leadingAnchor.constraint(equalTo: imgAvatar.trailingAnchor, constant: 16).isActive = true
        lbDesc.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -100).isActive = true
        lbDesc.numberOfLines = 0
        
        // btnFollow
        btnFollow.translatesAutoresizingMaskIntoConstraints = false
        btnFollow.topAnchor.constraint(equalTo: self.topAnchor, constant: 24).isActive = true
        btnFollow.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        btnFollow.widthAnchor.constraint(equalToConstant: 60).isActive = true
        btnFollow.setTitle("Follow", for: .normal)
        btnFollow.layer.masksToBounds = true
        btnFollow.layer.cornerRadius = 4
        btnFollow.backgroundColor = .blue
        btnFollow.setTitleColor(.white, for: .normal)
        
    }
    
}
