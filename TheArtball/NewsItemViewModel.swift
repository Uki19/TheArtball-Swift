//
//  NewsItemViewModel.swift
//  TheArtball
//
//  Created by Uros Zivaljevic on 10/13/16.
//  Copyright © 2016 Uros Zivaljevic. All rights reserved.
//

import Foundation
import DTCoreText

struct NewsItemViewModel {
    
    var attributedContent: NSAttributedString?
    
    init(newsItem: NewsItem){
        attributedContent = buildAttributedContent(content: newsItem.body)
    }
    
    
    private func buildAttributedContent(content: String) -> NSAttributedString? {
        
        let htmlTaggedString = HTMLTagsHelper.addHTMLTags(text: content)
        
        let contentData = htmlTaggedString.data(using: .utf8)
        
        let options: [String: Any] = [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,
                                      DTDefaultFontSize: 14.0,
                                      DTDefaultFontFamily: "HelveticaNeue",
                                      DTDefaultFontName: "HelveticaNeue"]
        
        let attributedContent = NSAttributedString(htmlData: contentData, options: options, documentAttributes: nil)
        
        return attributedContent
    }
    
}
