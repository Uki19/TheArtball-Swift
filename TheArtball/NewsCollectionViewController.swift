//
//  NewsCollectionViewController.swift
//  TheArtball
//
//  Created by Uros Zivaljevic on 9/24/16.
//  Copyright © 2016 Uros Zivaljevic. All rights reserved.
//

import UIKit

class NewsCollectionViewController: BaseCollectionViewController, UICollectionViewDelegateFlowLayout {

    private let reuseIdentifier = "newsCell"
    private let CELL_SPACING: CGFloat = 1.0
    private let SECTION_INSETS: CGFloat = 1.0
    
    var category: Category?
    var newsItems = [NewsItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getNews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
 
    // MARK: - API Methods
    
    func getNews() {
        let newsService = NewsService()
        currentState = .loading
        newsService.getAllNews() { (error, responseData) in
            DispatchQueue.main.async {
                self.newsItems = responseData as! [NewsItem]
                self.collectionView?.reloadData()
                if self.newsItems.count == 0 {
                    self.currentState = .noContent
                } else {
                    self.currentState = .filled
                }
            }
        }

    }
    

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! NewsCollectionViewCell
        
        let newsItem = newsItems[indexPath.row]
        cell.configureCell(newsItem: newsItem)
    
        return cell
    }
    
    // MARK: UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = self.view.frame.width/2 - CELL_SPACING - SECTION_INSETS
        return CGSize(width: cellWidth, height: cellWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CELL_SPACING
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: SECTION_INSETS, left: SECTION_INSETS, bottom: SECTION_INSETS, right: SECTION_INSETS)
    }
    
}
