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
    
    init(withDictionary dictionary: JSONObject) {
        id = dictionary["id"] as! Int
        title = dictionary["title"] as! String
        body = dictionary["body"] as! String
        author = dictionary["author"] as! String
    }
    
}

