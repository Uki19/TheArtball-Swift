//
//  Article.swift
//  TheArtball
//
//  Created by Uros Zivaljevic on 9/24/16.
//  Copyright © 2016 Uros Zivaljevic. All rights reserved.
//

import Foundation

struct Article: Model {
    
    var id: Int
    var title: String
    var body: String
    //    var date: String
    var author: String
    
    init?(withDictionary dictionary: JSONObject) {
        
        guard let id = dictionary["id"] as? Int,
            let title = dictionary["title"] as? String,
            let body = dictionary["body"] as? String,
            let author = dictionary["author"] as? String
            else { return nil }
        
        self.id = id
        self.title = title
        self.body = body
        self.author = author
    }
    
}

