//
//  NewsItem.swift
//  TheArtball
//
//  Created by Uros Zivaljevic on 9/24/16.
//  Copyright © 2016 Uros Zivaljevic. All rights reserved.
//

import Foundation

struct NewsItem: Model {
    
    var id: Int
    var title: String
    var body: String
//    var category: Category?
//    var date: String
    
    init?(withDictionary dictionary: JSONObject) {
        
        guard let id = dictionary["id"] as? Int,
            let title = dictionary["title"] as? String,
            let body = dictionary["body"] as? String
            else { return nil }
        
        self.id = id
        self.title = title
        self.body = body
        
//        category = dictionary["category"]!
//        date = dictionary["date"] as! String
//        category = nil
    }
}
