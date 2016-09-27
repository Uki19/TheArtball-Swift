//
//  Resource.swift
//  TheArtball
//
//  Created by Uros Zivaljevic on 9/25/16.
//  Copyright © 2016 Uros Zivaljevic. All rights reserved.
//

import Foundation

struct Resource {
//    static let kNews = "/posts"
    static let kNews = "/?rows=0&id={index}&title={firstName}&body={lastName}&delay=3"
    static let kArticles = "/?rows=10&id={index}&title={firstName}&body={lastName}&author={lastName}&delay=3"
}
