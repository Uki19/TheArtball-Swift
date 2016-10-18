//
//  NewsDetailsViewController.swift
//  TheArtball
//
//  Created by Uros Zivaljevic on 9/30/16.
//  Copyright © 2016 Uros Zivaljevic. All rights reserved.
//

import UIKit
import DTCoreText


class NewsDetailsViewController: UIViewController, UIScrollViewDelegate, DTAttributedTextContentViewDelegate {
    
    let HEADER_HEIGHT: CGFloat = 250.0
    
    @IBOutlet weak var newsTextView: DTAttributedTextView! {
        didSet {
            newsTextView.isScrollEnabled = false
            newsTextView.shouldDrawImages = false
            newsTextView.textDelegate = self
        }
    }
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.delegate = self
        }
    }
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsTitleLabel: UILabel!
    
    @IBOutlet weak var contentHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var topViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var topViewTopSpaceConstraint: NSLayoutConstraint!
    
    var newsItem: NewsItem!
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNewsData()   
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Setup functions
    
    func setupNewsData() {
        
        let newsItemViewModel = NewsItemViewModel(newsItem: newsItem)
        newsTextView.attributedString = newsItemViewModel.attributedContent
        newsImageView.sd_setImage(with: URL(string: newsItem.imageUrl)!)
        newsTitleLabel.text = newsItem.title
        
        //Set news text view constraint to match content size, to update scrollview size
        newsTextView.layoutIfNeeded()
        contentHeightConstraint.constant = newsTextView.contentSize.height
    }
    
    // MARK: ScrollViewDelegate
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView.contentOffset.y < 0 {
            topViewHeightConstraint.constant = HEADER_HEIGHT - scrollView.contentOffset.y
            topViewTopSpaceConstraint.constant = scrollView.contentOffset.y
        }
    }
    
    // MARK: DTAttributedTextContentViewDelegate
    
    func attributedTextContentView(_ attributedTextContentView: DTAttributedTextContentView!, viewFor attachment: DTTextAttachment!, frame: CGRect) -> UIView! {
        
        var attachmentView: UIView? = nil
        
        if attachment is DTImageTextAttachment {
            let attachmentImageView = UIImageView(frame: frame)
            attachmentImageView.sd_setImage(with: attachment.contentURL, placeholderImage: #imageLiteral(resourceName: "placeholder"))
            attachmentImageView.contentMode = .scaleAspectFill
            attachmentImageView.clipsToBounds = true
            attachmentView = attachmentImageView
        }
        
        if attachment is DTIframeTextAttachment {
            let playerView = YTPlayerView(frame: frame)
            let videoUrlString = attachment.contentURL.absoluteString
            let videoId = videoUrlString.substring(with: videoUrlString.index(videoUrlString.endIndex, offsetBy: -11)..<videoUrlString.endIndex)
            playerView.load(withVideoId: videoId)
            attachmentView = playerView
        }
        
        attachment.originalSize = CGSize(width: newsTextView.frame.width, height: newsTextView.frame.width)
        newsTextView.relayoutText()
        contentHeightConstraint.constant = newsTextView.contentSize.height
        
        return attachmentView
    }
    
}
