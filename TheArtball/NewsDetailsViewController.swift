//
//  NewsDetailsViewController.swift
//  TheArtball
//
//  Created by Uros Zivaljevic on 9/30/16.
//  Copyright © 2016 Uros Zivaljevic. All rights reserved.
//

import UIKit
import DTCoreText

class NewsDetailsViewController: UIViewController, UIScrollViewDelegate {
    
    let HEADER_HEIGHT: CGFloat = 250.0
    
    @IBOutlet weak var newsTextView: DTAttributedTextView! {
        didSet {
            newsTextView.isScrollEnabled = false
        }
    }
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsTitleLabel: UILabel!
    
    @IBOutlet weak var contentHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var topViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var topViewTopSpaceConstraint: NSLayoutConstraint!
    
    var newsItem: NewsItem!
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        
        setupNewsData()
        
        let newsItemViewModel = NewsItemViewModel(newsItem: newsItem)
        
        newsTextView.attributedString = newsItemViewModel.attributedContent
        newsTextView.layoutIfNeeded()
        contentHeightConstraint.constant = newsTextView.contentSize.height
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Setup functions
    
    func setupNewsData() {
        newsImageView.sd_setImage(with: URL(string: newsItem.imageUrl)!)
        newsTitleLabel.text = newsItem.title
    }
    
    // MARK: ScrollViewDelegate
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView.contentOffset.y < 0 {
            topViewHeightConstraint.constant = HEADER_HEIGHT - scrollView.contentOffset.y
            topViewTopSpaceConstraint.constant = scrollView.contentOffset.y
        }
    }
    
}
