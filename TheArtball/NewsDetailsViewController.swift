//
//  NewsDetailsViewController.swift
//  TheArtball
//
//  Created by Uros Zivaljevic on 9/30/16.
//  Copyright © 2016 Uros Zivaljevic. All rights reserved.
//

import UIKit

class NewsDetailsViewController: UIViewController, UIScrollViewDelegate {

    let HEADER_HEIGHT: CGFloat = 250.0
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var skyImage: UIImageView!
    @IBOutlet weak var topViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var topViewTopSpaceConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        // Do any additional setup after loading the view.
        
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView.contentOffset.y < HEADER_HEIGHT {
            print(scrollView.contentOffset.y)
            topViewHeightConstraint.constant = HEADER_HEIGHT - scrollView.contentOffset.y
            topViewTopSpaceConstraint.constant = scrollView.contentOffset.y
        }
    }
    
}
