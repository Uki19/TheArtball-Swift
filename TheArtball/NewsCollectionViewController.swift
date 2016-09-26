//
//  NewsCollectionViewController.swift
//  TheArtball
//
//  Created by Uros Zivaljevic on 9/24/16.
//  Copyright © 2016 Uros Zivaljevic. All rights reserved.
//

import UIKit

private let reuseIdentifier = "newsCell"

class NewsCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var category: Category?
    var newsItems = [NewsItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let newsService = NewsService()
        newsService.getAllNews() { (error, responseData) in
            DispatchQueue.main.async {
                self.newsItems = responseData as! [NewsItem]
                self.collectionView?.reloadData()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width/2, height: self.view.frame.width/2)
    }
    
    
}
