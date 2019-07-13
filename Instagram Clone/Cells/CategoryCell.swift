//
//  CategoryCell.swift
//  Instagram Clone
//
//  Created by Suprianto Djamalu on 13/07/19.
//  Copyright © 2019 Suprianto Djamalu. All rights reserved.
//

import Foundation
import UIKit

class CategoryCell: UICollectionViewCell{
    
    let viewCategoryHolder = UIView()
    let lbCategory = UILabel()
    
    func build(category: String){
        setupUI()
        
        lbCategory.text = category
    }
    
    private func setupUI(){
        
        // view
        self.addSubview(viewCategoryHolder)
        
        // viewCategoryHolder
        viewCategoryHolder.translatesAutoresizingMaskIntoConstraints = false
        viewCategoryHolder.topAnchor.constraint(equalTo: self.topAnchor, constant: 4).isActive = true
        viewCategoryHolder.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4).isActive = true
        viewCategoryHolder.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4).isActive = true
        viewCategoryHolder.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -4).isActive = true
        viewCategoryHolder.layer.borderWidth = 1
        viewCategoryHolder.layer.borderColor = UIColor.gray.cgColor
        viewCategoryHolder.layer.cornerRadius = 14
        viewCategoryHolder.addSubview(lbCategory)
        
        // lbCategory
        lbCategory.translatesAutoresizingMaskIntoConstraints = false
        lbCategory.topAnchor.constraint(equalTo: viewCategoryHolder.topAnchor, constant: 2).isActive = true
        lbCategory.bottomAnchor.constraint(equalTo: viewCategoryHolder.bottomAnchor, constant: -2).isActive = true
        lbCategory.leadingAnchor.constraint(equalTo: viewCategoryHolder.leadingAnchor, constant: 10).isActive = true
        lbCategory.trailingAnchor.constraint(equalTo: viewCategoryHolder.trailingAnchor, constant: -10).isActive = true
        lbCategory.text = "Catogory"
        lbCategory.font = UIFont.boldSystemFont(ofSize: 16)
        
    }
    
}
