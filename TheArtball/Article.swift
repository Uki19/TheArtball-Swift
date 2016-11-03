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
    var date: String
    var author: String
    var imageUrl: String
    var comments: [Comment]
    
    init?(withDictionary dictionary: JSONObject) {
        
        guard let id = dictionary["id"] as? Int,
            let title = dictionary["title"] as? String,
            let body = dictionary["content"] as? String,
            let author = dictionary["author"] as? String,
            let imageUrl = dictionary["image"] as? String,
            let date = dictionary["date"] as? String,
            let commentsDict = dictionary["comments"] as? JSONArray
            else { return nil }
        
        self.id = id
        self.title = title
        self.body = body
        self.author = author
        self.imageUrl = imageUrl
        self.date = date
        comments = [Comment]()
        for commentJSON in commentsDict {
            if let comment = Comment(withDictionary: commentJSON) {
                comments.append(comment)
            }
        }
    }
    
}

