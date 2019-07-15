//
//  LoveController.swift
//  Instagram Clone
//
//  Created by Suprianto Djamalu on 13/07/19.
//  Copyright © 2019 Suprianto Djamalu. All rights reserved.
//

import Foundation
import UIKit

class LoveController: UIViewController{
    
    private let scrollView = UIScrollView()
    private let lbFollowRequest = UILabel()
    private let lbFollowRequestTotal = UILabel()
    private let viewBlueDot = UIView()
    private let viewGrayLine = UIView()
    private let tableFollowing = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        setupUI()
        
        DispatchQueue.main.async {
            self.scrollView.contentSize.height = self.tableFollowing.contentSize.height + 50
        }
    }
    
    private func setupUI(){
        
        // view
        view.addSubview(scrollView)
        
        // navigation
        navigationItem.title = "Following"
        
        // scrollView
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.addSubview(lbFollowRequest)
        scrollView.addSubview(lbFollowRequestTotal)
        scrollView.addSubview(viewBlueDot)
        scrollView.addSubview(viewGrayLine)
        scrollView.addSubview(tableFollowing)
        
        // lbFollowRequest
        lbFollowRequest.translatesAutoresizingMaskIntoConstraints = false
        lbFollowRequest.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16).isActive = true
        lbFollowRequest.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16).isActive = true
        lbFollowRequest.text = "Follow Request"
        
        // lbFollowRequestTotal
        lbFollowRequestTotal.translatesAutoresizingMaskIntoConstraints = false
        lbFollowRequestTotal.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16).isActive = true
        lbFollowRequestTotal.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        lbFollowRequestTotal.text = "99"
        
        // viewBlueDot
        viewBlueDot.translatesAutoresizingMaskIntoConstraints = false
        viewBlueDot.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 23).isActive = true
        viewBlueDot.trailingAnchor.constraint(equalTo: lbFollowRequestTotal.leadingAnchor, constant: -10).isActive = true
        viewBlueDot.heightAnchor.constraint(equalToConstant: 10).isActive = true
        viewBlueDot.widthAnchor.constraint(equalToConstant: 10).isActive = true
        viewBlueDot.backgroundColor = .blue
        viewBlueDot.layer.masksToBounds = true
        viewBlueDot.layer.cornerRadius = 10 / 2
        
        // viewGrayLine
        viewGrayLine.translatesAutoresizingMaskIntoConstraints = false
        viewGrayLine.topAnchor.constraint(equalTo: lbFollowRequest.bottomAnchor, constant: 16).isActive = true
        viewGrayLine.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        viewGrayLine.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        viewGrayLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        viewGrayLine.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1.0)
        
        // tableFollowing
        tableFollowing.translatesAutoresizingMaskIntoConstraints = false
        tableFollowing.topAnchor.constraint(equalTo: viewGrayLine.bottomAnchor).isActive = true
        tableFollowing.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        tableFollowing.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableFollowing.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableFollowing.isScrollEnabled = false
        tableFollowing.register(FollowingCell.self, forCellReuseIdentifier: "FollowingCell")
        tableFollowing.delegate = self
        tableFollowing.dataSource = self
        
    }
    
}

extension LoveController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FollowingCell") as! FollowingCell
        cell.build(index: indexPath.row)
        return cell
    }
}

extension LoveController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
}
