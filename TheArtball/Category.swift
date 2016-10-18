//
//  Category.swift
//  TheArtball
//
//  Created by Uros Zivaljevic on 9/24/16.
//  Copyright © 2016 Uros Zivaljevic. All rights reserved.
//

import Foundation

enum Category: Int, Comparable {
    case all = 0
    case competition = 1
    case video = 2
    case other = 3
    
    func next() -> Category? {
        switch self {
        case .all:
            return .competition
        case .competition:
            return .video
        case .video:
            return .other
        case .other:
            return nil
        }
    }
    
    func previous() -> Category? {
        switch self {
        case .all:
            return nil
        case .competition:
            return .all
        case .video:
            return .competition
        case .other:
            return .video
        }
    }
    
    func getCategoryName() -> String {
        switch self {
        case .all:
            return "All"
        case .competition:
            return "Competitions"
        case .video:
            return "Videos"
        case .other:
            return "Other"
        }
    }
    
    static func < (leftCategory: Category, rightCategory: Category) -> Bool {
        return leftCategory.rawValue < rightCategory.rawValue
    }
    
}
