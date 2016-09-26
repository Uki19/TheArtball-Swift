//
//  Category.swift
//  TheArtball
//
//  Created by Uros Zivaljevic on 9/24/16.
//  Copyright © 2016 Uros Zivaljevic. All rights reserved.
//

import Foundation

enum Category: Int, Comparable {
    case All = 0
    case Competition = 1
    case Video = 2
    case Other = 3
    
    func next() -> Category? {
        switch self {
        case .All:
            return .Competition
        case .Competition:
            return .Video
        case .Video:
            return .Other
        case .Other:
            return nil
        }
    }
    
    func previous() -> Category? {
        switch self {
        case .All:
            return nil
        case .Competition:
            return .All
        case .Video:
            return .Competition
        case .Other:
            return .Video
        }
    }
    
    static func < (leftCategory: Category, rightCategory: Category) -> Bool {
        return leftCategory.rawValue < rightCategory.rawValue
    }
    
}
