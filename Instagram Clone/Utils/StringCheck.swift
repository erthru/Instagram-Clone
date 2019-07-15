//
//  StringCheck.swift
//  Instagram Clone
//
//  Created by Suprianto Djamalu on 15/07/19.
//  Copyright © 2019 Suprianto Djamalu. All rights reserved.
//

import Foundation
import UIKit

class StringCheck {
    
    static func attributedText(withString string: String, boldString: String) -> NSAttributedString {
        let attrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)]
        let attributedString = NSMutableAttributedString(string: boldString, attributes:attrs)
        let normalString = NSMutableAttributedString(string: string)
        attributedString.append(normalString)
        return attributedString
    }
}
