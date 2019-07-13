//
//  Post.swift
//  Instagram Clone
//
//  Created by Suprianto Djamalu on 13/07/19.
//  Copyright © 2019 Suprianto Djamalu. All rights reserved.
//

import Foundation

struct Post: Decodable {
    
    let id: Int
    let caption: String
    let thumbnail: String
    let username: String
    let avatar: String
    
}
