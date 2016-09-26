//
//  NewsCollectionViewCell.swift
//  TheArtball
//
//  Created by Uros Zivaljevic on 9/24/16.
//  Copyright © 2016 Uros Zivaljevic. All rights reserved.
//

import UIKit
import SDWebImage

class NewsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var newstitleLabel: UILabel!
    @IBOutlet weak var newsItemImageView: UIImageView!
    
    func configureCell(newsItem: NewsItem) {
        newstitleLabel.text = newsItem.title
        newsItemImageView.sd_setImage(with: URL(string: "http://i212.photobucket.com/albums/cc87/PhotoJenny89/KopievonDSC00118.jpg")!)
    }
    
}
