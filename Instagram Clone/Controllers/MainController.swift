//
//  ViewController.swift
//  Instagram Clone
//
//  Created by Suprianto Djamalu on 13/07/19.
//  Copyright © 2019 Suprianto Djamalu. All rights reserved.
//

import UIKit

class MainController: UIViewController {

    private let tabBar = UITabBarController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        setupUI()
    }

    private func setupUI(){
        
        // view
        view.backgroundColor = .white
        view.addSubview(tabBar.view)
        
        // tabBar
        let homeVC = HomeController()
        homeVC.tabBarItem = UITabBarItem.init(title: nil, image: UIImage(named: "img_home"), tag: 0)
        homeVC.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        let searchVC = SearchController()
        searchVC.tabBarItem = UITabBarItem.init(title: nil, image: UIImage(named: "img_search"), tag: 1)
        searchVC.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        let publishVC = PublishController()
        publishVC.tabBarItem = UITabBarItem.init(title: nil, image: UIImage(named: "img_plus"), tag: 2)
        publishVC.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        let loveVC = LoveController()
        loveVC.tabBarItem = UITabBarItem.init(title: nil, image: UIImage(named: "img_love"), tag: 3)
        loveVC.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        let profileVC = ProfileController()
        profileVC.tabBarItem = UITabBarItem.init(title: nil, image: UIImage(named: "img_profile"), tag: 4)
        profileVC.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        let controllers = [homeVC,searchVC,publishVC,loveVC,profileVC]
        tabBar.view.tintColor = .black
        tabBar.viewControllers = controllers.map({ UINavigationController(rootViewController: $0) })
        
    }
    
}

