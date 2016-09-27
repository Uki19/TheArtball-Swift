//
//  ArticlesTableViewController.swift
//  TheArtball
//
//  Created by Uros Zivaljevic on 9/24/16.
//  Copyright © 2016 Uros Zivaljevic. All rights reserved.
//

import UIKit

class ArticlesTableViewController: BaseTableViewController {

    private let reuseIdentifier = "articleCell"
    var articles = [Article]()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentState = .loading
        getArticles()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func refresh(sender: UIRefreshControl) {
        getArticles()
    }
    
    // MARK: - API Methods
    
    func getArticles(){
        
        let articlesService = ArticlesService()
        articlesService.getAllArticles { (error, articles) in
            DispatchQueue.main.async {
                self.articles = articles as! [Article]
                self.tableView.reloadData()
                self.myRefreshControl.endRefreshing()
                self.currentState = .filled
            }
        }
        
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! ArticlesTableViewCell
        let article = self.articles[indexPath.row]
        
        cell.configureCell(article: article)
        
        return cell
    }

}
