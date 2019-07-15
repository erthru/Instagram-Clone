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
    private let viewPost = UIView()
    private let lbTotalPost = UILabel()
    private let lbPost = UILabel()
    private let viewFollowers = UIView()
    private let lbTotalFollowers = UILabel()
    private let lbFollowers = UILabel()
    private let viewFollowing = UIView()
    private let lbTotalFollowing = UILabel()
    private let lbFollowing = UILabel()
    private let lbUser = UILabel()
    private let lbUserInfo = UILabel()
    private let btnEditProfile = UIButton(type: .system)
    private let lbStoryHighlights = UILabel()
    private let imgHighlights = UIImageView(image: UIImage(named: "img_plus"))
    private let lbInfoHighlights = UILabel()
    private let lbInfoHighlights2 = UILabel()
    
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
        view.addSubview(viewPost)
        view.addSubview(viewFollowing)
        view.addSubview(viewFollowers)
        view.addSubview(lbUser)
        view.addSubview(lbUserInfo)
        view.addSubview(btnEditProfile)
        view.addSubview(lbStoryHighlights)
        view.addSubview(imgHighlights)
        view.addSubview(lbInfoHighlights)
        view.addSubview(lbInfoHighlights2)
        
        // navigation
        navigationItem.title = "alexa"
        
        // imgAvatar
        imgAvatar.translatesAutoresizingMaskIntoConstraints = false
        imgAvatar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        imgAvatar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        imgAvatar.widthAnchor.constraint(equalToConstant: 90).isActive = true
        imgAvatar.heightAnchor.constraint(equalToConstant: 90).isActive = true
        imgAvatar.layer.masksToBounds = true
        imgAvatar.layer.cornerRadius = 90 / 2
        imgAvatar.layer.borderWidth = 4
        imgAvatar.layer.borderColor = UIColor.gray.cgColor
        
        // viewPost
        viewPost.translatesAutoresizingMaskIntoConstraints = false
        viewPost.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        viewPost.leadingAnchor.constraint(equalTo: imgAvatar.trailingAnchor, constant: 16).isActive = true
        viewPost.widthAnchor.constraint(equalToConstant: 70).isActive = true
        viewPost.heightAnchor.constraint(equalToConstant: 47).isActive = true
        viewPost.addSubview(lbTotalPost)
        viewPost.addSubview(lbPost)
        
        // lbTotalPost
        lbTotalPost.translatesAutoresizingMaskIntoConstraints = false
        lbTotalPost.topAnchor.constraint(equalTo: viewPost.topAnchor).isActive = true
        lbTotalPost.centerXAnchor.constraint(equalTo: viewPost.centerXAnchor).isActive = true
        lbTotalPost.text = "0"
        lbTotalPost.font = UIFont.boldSystemFont(ofSize: 19)
        
        // lbPost
        lbPost.translatesAutoresizingMaskIntoConstraints = false
        lbPost.bottomAnchor.constraint(equalTo: viewPost.bottomAnchor).isActive = true
        lbPost.centerXAnchor.constraint(equalTo: viewPost.centerXAnchor).isActive = true
        lbPost.text = "Posts"
        
        // viewFollowers
        viewFollowers.translatesAutoresizingMaskIntoConstraints = false
        viewFollowers.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        viewFollowers.leadingAnchor.constraint(equalTo: viewPost.trailingAnchor, constant: 10).isActive = true
        viewFollowers.widthAnchor.constraint(equalToConstant: 70).isActive = true
        viewFollowers.heightAnchor.constraint(equalToConstant: 47).isActive = true
        viewFollowers.addSubview(lbTotalFollowers)
        viewFollowers.addSubview(lbFollowers)
        
        // lbTotalFollowers
        lbTotalFollowers.translatesAutoresizingMaskIntoConstraints = false
        lbTotalFollowers.topAnchor.constraint(equalTo: viewFollowers.topAnchor).isActive = true
        lbTotalFollowers.centerXAnchor.constraint(equalTo: viewFollowers.centerXAnchor).isActive = true
        lbTotalFollowers.text = "999"
        lbTotalFollowers.font = UIFont.boldSystemFont(ofSize: 19)
        
        // lbFollowers
        lbFollowers.translatesAutoresizingMaskIntoConstraints = false
        lbFollowers.bottomAnchor.constraint(equalTo: viewFollowers.bottomAnchor).isActive = true
        lbFollowers.centerXAnchor.constraint(equalTo: viewFollowers.centerXAnchor).isActive = true
        lbFollowers.text = "Followers"
        
        // viewFollowing
        viewFollowing.translatesAutoresizingMaskIntoConstraints = false
        viewFollowing.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        viewFollowing.leadingAnchor.constraint(equalTo: viewFollowers.trailingAnchor, constant: 20).isActive = true
        viewFollowing.widthAnchor.constraint(equalToConstant: 70).isActive = true
        viewFollowing.heightAnchor.constraint(equalToConstant: 47).isActive = true
        viewFollowing.addSubview(lbTotalFollowing)
        viewFollowing.addSubview(lbFollowing)
        
        // lbTotalFollowing
        lbTotalFollowing.translatesAutoresizingMaskIntoConstraints = false
        lbTotalFollowing.topAnchor.constraint(equalTo: viewFollowing.topAnchor).isActive = true
        lbTotalFollowing.centerXAnchor.constraint(equalTo: viewFollowing.centerXAnchor).isActive = true
        lbTotalFollowing.text = "10"
        lbTotalFollowing.font = UIFont.boldSystemFont(ofSize: 19)
        
        // lbFollowing
        lbFollowing.translatesAutoresizingMaskIntoConstraints = false
        lbFollowing.bottomAnchor.constraint(equalTo: viewFollowing.bottomAnchor).isActive = true
        lbFollowing.centerXAnchor.constraint(equalTo: viewFollowing.centerXAnchor).isActive = true
        lbFollowing.text = "Following"
        
        // lbUser
        lbUser.translatesAutoresizingMaskIntoConstraints = false
        lbUser.topAnchor.constraint(equalTo: imgAvatar.bottomAnchor, constant: 16).isActive = true
        lbUser.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        lbUser.text = "Alexa Milamingos"
        lbUser.font = UIFont.boldSystemFont(ofSize: 18)
        
        // lbUserInfo
        lbUserInfo.translatesAutoresizingMaskIntoConstraints = false
        lbUserInfo.topAnchor.constraint(equalTo: lbUser.bottomAnchor, constant: 2).isActive = true
        lbUserInfo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        lbUserInfo.text = "|| Apple Apps Creator\n|| Badminton\n|| Yugioh Duelisto wkwk"
        lbUserInfo.numberOfLines = 0
        
        // btnEditProfile
        btnEditProfile.translatesAutoresizingMaskIntoConstraints = false
        btnEditProfile.topAnchor.constraint(equalTo: lbUserInfo.bottomAnchor, constant: 20).isActive = true
        btnEditProfile.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        btnEditProfile.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        btnEditProfile.setTitle("Edit Profile", for: .normal)
        btnEditProfile.layer.masksToBounds = true
        btnEditProfile.layer.borderColor = UIColor.gray.cgColor
        btnEditProfile.layer.borderWidth = 1
        btnEditProfile.layer.cornerRadius = 4
        
        // lbStoryHightlights
        lbStoryHighlights.translatesAutoresizingMaskIntoConstraints = false
        lbStoryHighlights.topAnchor.constraint(equalTo: btnEditProfile.bottomAnchor, constant: 20).isActive = true
        lbStoryHighlights.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        lbStoryHighlights.text = "Story Highlights"
        lbStoryHighlights.font = UIFont.boldSystemFont(ofSize: 18)
        
        // imgHighlights
        imgHighlights.translatesAutoresizingMaskIntoConstraints = false
        imgHighlights.topAnchor.constraint(equalTo: lbStoryHighlights.bottomAnchor, constant: 36).isActive = true
        imgHighlights.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imgHighlights.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imgHighlights.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        // lbInfoHighlights
        lbInfoHighlights.translatesAutoresizingMaskIntoConstraints = false
        lbInfoHighlights.topAnchor.constraint(equalTo: imgHighlights.bottomAnchor, constant: 20).isActive = true
        lbInfoHighlights.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        lbInfoHighlights.text = "Share Photos and Videos"
        lbInfoHighlights.font = UIFont.systemFont(ofSize: 24)
        
        // lbInfoHighlights2
        lbInfoHighlights2.translatesAutoresizingMaskIntoConstraints = false
        lbInfoHighlights2.topAnchor.constraint(equalTo: lbInfoHighlights.bottomAnchor, constant: 16).isActive = true
        lbInfoHighlights2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 26).isActive = true
        lbInfoHighlights2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -26).isActive = true
        lbInfoHighlights2.text = "When you share photos and videos, they'll appear on your profile"
        lbInfoHighlights2.numberOfLines = 2
        lbInfoHighlights2.textAlignment = .center
        
    }
    
}
