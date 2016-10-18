//
//  ArticlesTableViewCell.swift
//  TheArtball
//
//  Created by Uros Zivaljevic on 9/24/16.
//  Copyright © 2016 Uros Zivaljevic. All rights reserved.
//

import UIKit

class ArticlesTableViewCell: UITableViewCell {

    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var articleTitleLabel: UILabel!
    @IBOutlet weak var articleAuthorLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func configureCell(article: Article) {
        articleTitleLabel.text = article.title
        articleAuthorLabel.text = article.author
        articleImageView.sd_setImage(with: URL(string: article.imageUrl)!, placeholderImage: #imageLiteral(resourceName: "placeholder"))
    }

}
