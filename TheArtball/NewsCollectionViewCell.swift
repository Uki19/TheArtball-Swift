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
    
    func configureCell(newsItem: NewsItem, indexPath: IndexPath) {
        newstitleLabel.text = newsItem.title
        newsItemImageView.sd_setImage(with: URL(string: newsItem.imageUrl)!, placeholderImage: #imageLiteral(resourceName: "placeholder"))
        if newsItem.important || indexPath.row == 0 {
            newstitleLabel.font = UIFont.systemFont(ofSize: 24.0)
        } else {
            newstitleLabel.font = UIFont.systemFont(ofSize: 15.0)
        }
    }
    
}
