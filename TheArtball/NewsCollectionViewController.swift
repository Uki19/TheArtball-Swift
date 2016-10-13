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
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentState = .loading
        getNews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Refresh
    
    override func refresh(sender: UIRefreshControl) {
        getNews()
    }
    
    // MARK: - API Methods
    
    func getNews() {
        let newsService = NewsService()
        newsService.getAllNews() { (error, responseData) in
            DispatchQueue.main.async {
                
                if error == nil {
                    self.newsItems = responseData as! [NewsItem]
                    if self.newsItems.count == 0 {
                        self.currentState = .noContent
                    } else {
                        self.currentState = .filled
                    }
                } else {
                    print(error?.localizedDescription)
                    self.currentState = .error
                }
                self.refreshControl.endRefreshing()
                self.collectionView?.reloadData()
            }
        }

    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "kHomeToNewsDetailsSegue" {
            if let newsDetailsVC = segue.destination as? NewsDetailsViewController,
                let senderCell = sender as? NewsCollectionViewCell {
                let indexPath = collectionView?.indexPath(for: senderCell)
                newsDetailsVC.newsItem = newsItems[indexPath!.row]
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
        cell.configureCell(newsItem: newsItem, indexPath: indexPath)
    
        return cell
    }
    
    // MARK: UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let newsItem = newsItems[indexPath.row]
        
        var cellWidth = self.view.frame.width/2 - CELL_SPACING - SECTION_INSETS
        
        if newsItem.important || indexPath.row == 0 {
            cellWidth = self.view.frame.width - CELL_SPACING - SECTION_INSETS
        }
        return CGSize(width: cellWidth, height: cellWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CELL_SPACING
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: SECTION_INSETS, left: SECTION_INSETS, bottom: SECTION_INSETS, right: SECTION_INSETS)
    }
    
}
