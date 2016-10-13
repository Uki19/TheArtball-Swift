//
//  Article.swift
//  TheArtball
//
//  Created by Uros Zivaljevic on 9/24/16.
//  Copyright © 2016 Uros Zivaljevic. All rights reserved.
//

import Foundation

struct Article: Model {
    
    var id: String
    var title: String
    var body: String
    var date: String
    var author: String
    var imageUrl: String
    
    init?(withDictionary dictionary: JSONObject) {
        
        guard let id = dictionary["id"] as? String,
            let title = dictionary["title"] as? String,
            let body = dictionary["content"] as? String,
            let author = dictionary["author"] as? String,
            let imageUrl = dictionary["image"] as? String,
            let date = dictionary["date"] as? String
            else { return nil }
        
        self.id = id
        self.title = title
        self.body = body
        self.author = author
        self.imageUrl = imageUrl
        self.date = date
    }
    
}

