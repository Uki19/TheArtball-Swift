//
//  CommentsViewController.swift
//  TheArtball
//
//  Created by Uros Zivaljevic on 10/20/16.
//  Copyright © 2016 Uros Zivaljevic. All rights reserved.
//

import UIKit

class CommentsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var commentsTableView: UITableView! {
        didSet {
            commentsTableView.delegate = self
            commentsTableView.dataSource = self
        }
    }
    
    let cellID = "commentsCell"
    var comments: [Comment]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if comments == nil {
            comments = [Comment]()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    // MARK: - UITableView datasource and delegate
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! CommentsTableViewCell
        
        let comment = comments[indexPath.row]
        cell.configureCell(comment: comment)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
 
}
