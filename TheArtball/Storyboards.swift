//
//  Storyboards.swift
//  TheArtball
//
//  Created by Uros Zivaljevic on 9/24/16.
//  Copyright © 2016 Uros Zivaljevic. All rights reserved.
//

import Foundation
import UIKit

enum Storyboards: String {
    case Main = "Main"
    case News = "News"
    case Article = "Articles"
    case Base = "Base"
}

extension UIStoryboard {
    
    convenience init(storyboardType: Storyboards) {
        self.init(name: storyboardType.rawValue, bundle: nil)
    }
}
