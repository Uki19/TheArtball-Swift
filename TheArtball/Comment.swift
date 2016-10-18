//
//  Comment.swift
//  TheArtball
//
//  Created by Uros Zivaljevic on 9/24/16.
//  Copyright © 2016 Uros Zivaljevic. All rights reserved.
//

import Foundation

struct Comment: Model {
    
    var id: Int
    var comment: String
    var author: String
    var date: String
    
    init?(withDictionary dictionary: JSONObject) {
        guard let id = dictionary["id"] as? Int,
            let author = dictionary["author"] as? String,
            let comment = dictionary["comment"] as? String,
            let date = dictionary["time"] as? String
            else { return nil }
        
        self.id = id
        self.comment = comment
        self.author = author
        self.date = date
    }
    
}
