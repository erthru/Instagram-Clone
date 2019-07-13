//
//  PostCell.swift
//  Instagram Clone
//
//  Created by Suprianto Djamalu on 13/07/19.
//  Copyright © 2019 Suprianto Djamalu. All rights reserved.
//

import Foundation
import UIKit

class PostCell: UICollectionViewCell{
    
    let imgAvatar = UIImageView(image: UIImage(named: "img_placeholder"))
    let lbUser = UILabel()
    let btnRight = UIButton(type: .system)
    let imgContent = UIImageView(image: UIImage(named: "img_placeholder"))
    let btnLove = UIButton(type: .system)
    let btnComment = UIButton(type: .system)
    let btnSend = UIButton(type: .system)
    let btnSave = UIButton(type: .system)
    let lbLikes = UILabel()
    let lbCaption = UILabel()
    let lbPostDate = UILabel()
    
    func build(post: Post){
        setupUI()
        
        imgAvatar.image = UIImage(named: post.avatar)
        lbUser.text = post.username.lowercased()
        imgContent.image = UIImage(named: post.thumbnail)
        lbCaption.attributedText = attributedText(withString: " \(post.caption)", boldString: post.username)
    }
    
    private func attributedText(withString string: String, boldString: String) -> NSAttributedString {
        let attrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)]
        let attributedString = NSMutableAttributedString(string: boldString, attributes:attrs)
        let normalString = NSMutableAttributedString(string: string)
        attributedString.append(normalString)
        return attributedString
    }
    
    private func setupUI(){
        
        // view
        self.addSubview(imgAvatar)
        self.addSubview(lbUser)
        self.addSubview(btnRight)
        self.addSubview(imgContent)
        self.addSubview(btnLove)
        self.addSubview(btnComment)
        self.addSubview(btnSend)
        self.addSubview(btnSave)
        self.addSubview(lbLikes)
        self.addSubview(lbCaption)
        self.addSubview(lbPostDate)
        
        // imgAvatar
        imgAvatar.translatesAutoresizingMaskIntoConstraints = false
        imgAvatar.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imgAvatar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        imgAvatar.heightAnchor.constraint(equalToConstant: 40).isActive = true
        imgAvatar.widthAnchor.constraint(equalToConstant: 40).isActive = true
        imgAvatar.layer.masksToBounds = true
        imgAvatar.layer.cornerRadius = 40 / 2
        imgAvatar.layer.borderColor = (UIColor.red).cgColor
        imgAvatar.layer.borderWidth = 2
        
        // lbUser
        lbUser.translatesAutoresizingMaskIntoConstraints = false
        lbUser.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        lbUser.leadingAnchor.constraint(equalTo: imgAvatar.trailingAnchor, constant: 10).isActive = true
        lbUser.text = "user"
        lbUser.font = UIFont.boldSystemFont(ofSize: 16)
        
        // btnRight
        btnRight.translatesAutoresizingMaskIntoConstraints = false
        btnRight.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        btnRight.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        btnRight.setImage(UIImage(named: "img_ellipsis"), for: .normal)
        
        // imgContent
        imgContent.translatesAutoresizingMaskIntoConstraints = false
        imgContent.topAnchor.constraint(equalTo: imgAvatar.bottomAnchor, constant: 10).isActive = true
        imgContent.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        imgContent.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        imgContent.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        // btnLove
        btnLove.translatesAutoresizingMaskIntoConstraints = false
        btnLove.topAnchor.constraint(equalTo: imgContent.bottomAnchor, constant: 16).isActive = true
        btnLove.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        btnLove.setImage(UIImage(named: "img_love"), for: .normal)
        
        // btnComment
        btnComment.translatesAutoresizingMaskIntoConstraints = false
        btnComment.topAnchor.constraint(equalTo: imgContent.bottomAnchor, constant: 16).isActive = true
        btnComment.leadingAnchor.constraint(equalTo: btnLove.trailingAnchor, constant: 20).isActive = true
        btnComment.setImage(UIImage(named: "img_chat"), for: .normal)
        
        // btnSend
        btnSend.translatesAutoresizingMaskIntoConstraints = false
        btnSend.topAnchor.constraint(equalTo: imgContent.bottomAnchor, constant: 16).isActive = true
        btnSend.leadingAnchor.constraint(equalTo: btnComment.trailingAnchor, constant: 20).isActive = true
        btnSend.setImage(UIImage(named: "img_send"), for: .normal)
        
        // btnSave
        btnSave.translatesAutoresizingMaskIntoConstraints = false
        btnSave.topAnchor.constraint(equalTo: imgContent.bottomAnchor, constant: 16).isActive = true
        btnSave.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        btnSave.setImage(UIImage(named: "img_folder"), for: .normal)
        
        // lbLikes
        lbLikes.translatesAutoresizingMaskIntoConstraints = false
        lbLikes.topAnchor.constraint(equalTo: btnLove.bottomAnchor, constant: 10).isActive = true
        lbLikes.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        lbLikes.text = "0 likes"
        lbLikes.font = UIFont.boldSystemFont(ofSize: 14)
        
        // lbCaption
        lbCaption.translatesAutoresizingMaskIntoConstraints = false
        lbCaption.topAnchor.constraint(equalTo: lbLikes.bottomAnchor, constant: 10).isActive = true
        lbCaption.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        lbCaption.text = "user my caption"
        
        // lbCaption
        lbPostDate.translatesAutoresizingMaskIntoConstraints = false
        lbPostDate.topAnchor.constraint(equalTo: lbCaption.bottomAnchor, constant: 10).isActive = true
        lbPostDate.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        lbPostDate.text = "2 mins ago"
        lbPostDate.textColor = .gray
        
    }
    
}
