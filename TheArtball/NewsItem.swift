//
//  NewsItem.swift
//  TheArtball
//
//  Created by Uros Zivaljevic on 9/24/16.
//  Copyright © 2016 Uros Zivaljevic. All rights reserved.
//

import Foundation

struct NewsItem: Model {
    
    var id: String
    var title: String
    var body: String
    var imageUrl: String
    //    var category: Category?
    var date: String
    var important: Bool
    
    init?(withDictionary dictionary: JSONObject) {
        
        guard let id = dictionary["id"] as? String,
            let title = dictionary["title"] as? String,
            let body = dictionary["content"] as? String,
            let imageUrl = dictionary["image"] as? String,
            let date = dictionary["date"] as? String,
            let important = dictionary["important"] as? String
            else { return nil }
        
        self.id = id
        self.title = title
        self.body = body
        self.imageUrl = imageUrl
        self.date = date
        self.important = (important == "1" ? true : false)
        //        category = dictionary["category"]!
        //        date = dictionary["date"] as! String
        //        category = nil
    }
}
