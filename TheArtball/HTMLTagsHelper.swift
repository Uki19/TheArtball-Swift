//
//  HTMLTagsHelper.swift
//  TheArtball
//
//  Created by Uros Zivaljevic on 10/13/16.
//  Copyright © 2016 Uros Zivaljevic. All rights reserved.
//

import Foundation

struct HTMLTagsHelper {
    
    
    static func addHTMLTags(text: String) -> String {
        
        let textWithTags = text;
        
        let textArray = textWithTags.components(separatedBy: " ")
        
        let taggedArray = textArray.map { (textElement: String) -> String in
            if textElement.contains("http")  {
                return "<a href='\(textElement)'>\(textElement)</a>"
            } else {
                return textElement
            }
        }
        
        return taggedArray.joined(separator: " ");
    }
    
    
}
