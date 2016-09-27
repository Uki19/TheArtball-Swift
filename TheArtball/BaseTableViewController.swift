//
//  BaseTableViewController.swift
//  TheArtball
//
//  Created by Uros Zivaljevic on 9/26/16.
//  Copyright © 2016 Uros Zivaljevic. All rights reserved.
//

import UIKit

enum DataViewState {
    case filled
    case loading
    case noContent
    case error
}

class BaseTableViewController: UITableViewController {
    
    var currentState: DataViewState = .loading {
        willSet {
            customizeViewsForState(state: newValue)
        }
    }
    
    var errorBackgroundView: StatusView = {
        let statusView = UIView.loadViewFromXib(name:"StatusView") as! StatusView
        statusView.statusLabel.text = "An Error Occured, please try later"
        statusView.statusImageView.image = #imageLiteral(resourceName: "warning")
        return statusView
    }()
    
    var noContentBackgroundView: StatusView = {
        let statusView = UIView.loadViewFromXib(name:"StatusView") as! StatusView
        statusView.statusLabel.text = "No Data"
        statusView.statusImageView.image = #imageLiteral(resourceName: "empty")
        return statusView
    }()
    
    var loadingBackgroundView = LoadingView()
    
    func customizeViewsForState(state: DataViewState) {
        
        switch state {
        case .filled:
            tableView.backgroundView = nil
        case .loading:
            tableView.backgroundView = loadingBackgroundView
        case .noContent:
            tableView.backgroundView = noContentBackgroundView
        case .error:
            tableView.backgroundView = errorBackgroundView
        }
        
    }
    

}
