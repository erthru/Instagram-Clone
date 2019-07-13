//
//  HomeController.swift
//  Instagram Clone
//
//  Created by Suprianto Djamalu on 13/07/19.
//  Copyright © 2019 Suprianto Djamalu. All rights reserved.
//

import Foundation
import UIKit

class HomeController: UIViewController{
    
    private let scrollView = UIScrollView()
    private let collectionStory = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    private let viewLine = UIView()
    private let collectionPost = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    
    private var stories = [Story]()
    private var posts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchStory()
        fetchPost()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        setupUI()
    }
    
    private func fetchStory(){
        
        stories.append(Story(id: 1, username: "Your Story", avatar: "img_user1"))
        stories.append(Story(id: 2, username: "alex", avatar: "img_user2"))
        stories.append(Story(id: 3, username: "borneo", avatar: "img_user3"))
        stories.append(Story(id: 4, username: "jarnet", avatar: "img_user4"))
        stories.append(Story(id: 5, username: "mayuko", avatar: "img_user5"))
        stories.append(Story(id: 6, username: "eve", avatar: "img_user6"))
        
        collectionStory.reloadData()
        
    }
    
    private func fetchPost(){
        
        posts.append(Post(id: 1, caption: "hello", thumbnail: "img_thumb1", username: "alexa", avatar: "img_user1"))
        posts.append(Post(id: 2, caption: "hi", thumbnail: "img_thumb2", username: "alex", avatar: "img_user2"))
        posts.append(Post(id: 3, caption: "hai", thumbnail: "img_thumb3", username: "borneo", avatar: "img_user3"))
        posts.append(Post(id: 4, caption: "hei", thumbnail: "img_thumb4", username: "jarnet", avatar: "img_user4"))
        posts.append(Post(id: 5, caption: "insta mitai", thumbnail: "img_thumb5", username: "mayuko", avatar: "img_user5"))
        posts.append(Post(id: 6, caption: "yo", thumbnail: "img_thumb6", username: "eve", avatar: "img_user6"))
        
        collectionPost.reloadData()
        
        DispatchQueue.main.async {
            self.scrollView.contentSize.height = self.collectionPost.contentSize.height + 150
        }
        
    }
    
    private func setupUI(){
        
        // view
        view.backgroundColor = .white
        view.addSubview(scrollView)
        
        // navigation
        navigationItem.title = "Instagram"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Billabong", size: 26)!]
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "img_send"), landscapeImagePhone: UIImage(named: "img_send"), style: .done, target: self, action: nil)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "img_camera"), landscapeImagePhone: UIImage(named: "img_camera"), style: .done, target: self, action: nil)
        
        // scrollView
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.addSubview(collectionStory)
        scrollView.addSubview(viewLine)
        scrollView.addSubview(collectionPost)
        
        // collectionStory
        collectionStory.translatesAutoresizingMaskIntoConstraints = false
        collectionStory.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16).isActive = true
        collectionStory.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16).isActive = true
        collectionStory.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionStory.heightAnchor.constraint(equalToConstant: 90).isActive = true
        collectionStory.backgroundColor = .white
        (collectionStory.collectionViewLayout as? UICollectionViewFlowLayout)?.scrollDirection = .horizontal
        collectionStory.register(StoryCell.self, forCellWithReuseIdentifier: "StoryCell")
        collectionStory.delegate = self
        collectionStory.dataSource = self
        
        // viewLine
        viewLine.translatesAutoresizingMaskIntoConstraints = false
        viewLine.topAnchor.constraint(equalTo: collectionStory.bottomAnchor, constant: 12).isActive = true
        viewLine.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        viewLine.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        viewLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        viewLine.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1.0)
        
        // collectionPost
        collectionPost.translatesAutoresizingMaskIntoConstraints = false
        collectionPost.topAnchor.constraint(equalTo: viewLine.bottomAnchor, constant: 10).isActive = true
        collectionPost.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        collectionPost.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        collectionPost.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionPost.register(PostCell.self, forCellWithReuseIdentifier: "PostCell")
        collectionPost.dataSource = self
        collectionPost.delegate = self
        collectionPost.backgroundColor = .white
        collectionPost.isScrollEnabled = false
        
    }
    
}

extension HomeController: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionStory {
            return stories.count
        }else{
            return posts.count
        }
    }

}

extension HomeController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionStory {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCell", for: indexPath) as! StoryCell
            cell.build(story: stories[indexPath.row])
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostCell", for: indexPath) as! PostCell
            cell.build(post: posts[indexPath.row])
            return cell
        }
    }
    
}

extension HomeController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collectionStory {
            return CGSize(width: 60, height: 90)
        }else{
            return CGSize(width: view.frame.width, height: 510)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 17
    }
    
}
