//
//  SearchController.swift
//  Instagram Clone
//
//  Created by Suprianto Djamalu on 13/07/19.
//  Copyright © 2019 Suprianto Djamalu. All rights reserved.
//

import Foundation
import UIKit

class SearchController: UIViewController{
    
    private let searchBar = UISearchController(searchResultsController: nil)
    private let scrollView = UIScrollView()
    private let collectionCategory = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    private let collectionTopPost = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    
    private let categories = ["IGTV", "Shop", "Style", "Beauty", "Sports", "Travel", "Science & Tech", "Nature"]
    private var topPosts = [TopPost]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchTopPost()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        setupUI()
    }
    
    private func fetchTopPost(){
        
        topPosts.append(TopPost(id: 1, thumbnail: "img_thumb1"))
        topPosts.append(TopPost(id: 2, thumbnail: "img_thumb2"))
        topPosts.append(TopPost(id: 3, thumbnail: "img_thumb3"))
        topPosts.append(TopPost(id: 4, thumbnail: "img_thumb4"))
        topPosts.append(TopPost(id: 5, thumbnail: "img_thumb5"))
        topPosts.append(TopPost(id: 6, thumbnail: "img_thumb6"))
        topPosts.append(TopPost(id: 7, thumbnail: "img_thumb1"))
        topPosts.append(TopPost(id: 8, thumbnail: "img_thumb2"))
        topPosts.append(TopPost(id: 9, thumbnail: "img_thumb3"))
        topPosts.append(TopPost(id: 10, thumbnail: "img_thumb4"))
        topPosts.append(TopPost(id: 11, thumbnail: "img_thumb5"))
        topPosts.append(TopPost(id: 12, thumbnail: "img_thumb6"))
        topPosts.append(TopPost(id: 13, thumbnail: "img_thumb1"))
        topPosts.append(TopPost(id: 14, thumbnail: "img_thumb2"))
        topPosts.append(TopPost(id: 15, thumbnail: "img_thumb3"))
        topPosts.append(TopPost(id: 16, thumbnail: "img_thumb4"))
        topPosts.append(TopPost(id: 17, thumbnail: "img_thumb5"))
        topPosts.append(TopPost(id: 19, thumbnail: "img_thumb6"))
        
        collectionTopPost.reloadData()
        
    }
    
    private func setupUI(){
        
        // view
        view.addSubview(scrollView)
        
        // navigation
        navigationItem.titleView = searchBar.searchBar
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "img_capture"), style: .plain, target: self, action: nil)
        
        // searchBar
        searchBar.searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.searchBar.heightAnchor.constraint(equalToConstant: 44).isActive = true
        searchBar.hidesNavigationBarDuringPresentation = false
        
        // scrollView
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.addSubview(collectionCategory)
        scrollView.addSubview(collectionTopPost)
        
        // collectionCategory
        collectionCategory.translatesAutoresizingMaskIntoConstraints = false
        collectionCategory.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10).isActive = true
        collectionCategory.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16).isActive = true
        collectionCategory.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionCategory.heightAnchor.constraint(equalToConstant: 50).isActive = true
        (collectionCategory.collectionViewLayout as? UICollectionViewFlowLayout)?.scrollDirection = .horizontal
        collectionCategory.register(CategoryCell.self, forCellWithReuseIdentifier: "CategoryCell")
        collectionCategory.backgroundColor = .white
        collectionCategory.delegate = self
        collectionCategory.dataSource = self
        
        // collectionTopPost
        collectionTopPost.translatesAutoresizingMaskIntoConstraints = false
        collectionTopPost.topAnchor.constraint(equalTo: collectionCategory.bottomAnchor, constant: 10).isActive = true
        collectionTopPost.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        collectionTopPost.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionTopPost.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        collectionTopPost.backgroundColor = .white
        collectionTopPost.register(TopPostCell.self, forCellWithReuseIdentifier: "TopPostCell")
        collectionTopPost.delegate = self
        collectionTopPost.dataSource = self
        
    }
    
}

extension SearchController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionCategory {
            return categories.count
        }else{
            return topPosts.count
        }
    }
    
}

extension SearchController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionCategory {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
            cell.build(category: categories[indexPath.row])
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopPostCell", for: indexPath) as! TopPostCell
            cell.build(thumbnail: topPosts[indexPath.row].thumbnail)
            return cell
        }
    }
    
}

extension SearchController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collectionCategory {
            let targetLabelSize = UILabel()
            targetLabelSize.text = categories[indexPath.row]
            targetLabelSize.sizeToFit()
            print(targetLabelSize.frame.width)
            return CGSize(width: targetLabelSize.frame.width + 30, height: 50)
        }else{
            return CGSize(width: (view.frame.width / 3) - 7, height: (view.frame.width / 3) - 7)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
    
}
