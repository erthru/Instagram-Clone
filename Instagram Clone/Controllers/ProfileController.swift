//
//  ProfileController.swift
//  Instagram Clone
//
//  Created by Suprianto Djamalu on 13/07/19.
//  Copyright © 2019 Suprianto Djamalu. All rights reserved.
//

import Foundation
import UIKit

class ProfileController: UIViewController{
    
    private let imgAvatar = UIImageView(image: UIImage(named: "img_user1"))
    private let lbTotalPost = UILabel()
    private let lbPost = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        setupUI()
    }
    
    private func setupUI(){
        
        // view
        view.addSubview(imgAvatar)
        view.addSubview(lbTotalPost)
        view.addSubview(lbPost)
        
        // navigation
        navigationItem.title = "alexa"
        
        // imgAvatar
        imgAvatar.translatesAutoresizingMaskIntoConstraints = false
        imgAvatar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        imgAvatar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        imgAvatar.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imgAvatar.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imgAvatar.layer.masksToBounds = true
        imgAvatar.layer.cornerRadius = 100 / 2
        imgAvatar.layer.borderWidth = 4
        imgAvatar.layer.borderColor = UIColor.gray.cgColor
        
        // lbTotalPost
        lbTotalPost.translatesAutoresizingMaskIntoConstraints = false
        lbTotalPost.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        lbTotalPost.leadingAnchor.constraint(equalTo: imgAvatar.leadingAnchor, constant: 150).isActive = true
        lbTotalPost.text = "0"
        lbTotalPost.font = UIFont.boldSystemFont(ofSize: 24)
        
        // lbPost
        lbPost.translatesAutoresizingMaskIntoConstraints = false
        lbPost.topAnchor.constraint(equalTo: lbTotalPost.bottomAnchor, constant: 4).isActive = true
        lbPost.leadingAnchor.constraint(equalTo: imgAvatar.leadingAnchor, constant: 140).isActive = true
        lbPost.text = "Posts"
        
    }
    
}
