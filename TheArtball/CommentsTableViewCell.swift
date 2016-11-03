//
//  CommentTableViewCell.swift
//  TheArtball
//
//  Created by Uros Zivaljevic on 10/20/16.
//  Copyright © 2016 Uros Zivaljevic. All rights reserved.
//

import UIKit

class CommentsTableViewCell: UITableViewCell {

    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

    func configureCell(comment: Comment){
        authorNameLabel.text = comment.author
        commentLabel.text = comment.comment
    }
    
}
