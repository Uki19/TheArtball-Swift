//
//  BaseTableViewController.swift
//  TheArtball
//
//  Created by Uros Zivaljevic on 9/26/16.
//  Copyright © 2016 Uros Zivaljevic. All rights reserved.
//

import UIKit

enum TableViewState {
    case filled
    case loading
    case noContent
    case error
}

class BaseTableViewController: UITableViewController {

  
    var currentState: TableViewState = .loading {
        didSet {
            customizeViewsForState(state: currentState)
        }
    }
    var errorBackgroundView: TableStatusView = {
        let statusView = UIView.loadViewFromXib(name:"TableStatusView") as! TableStatusView
        statusView.statusLabel.text = "An Error Occured, please try later"
        return statusView
    }()
    
    var noContentBackgroundView: TableStatusView = {
        let statusView = UIView.loadViewFromXib(name:"TableStatusView") as! TableStatusView
        statusView.statusLabel.text = "No Data"
        return statusView
    }()
    
    // MARK: - State methods
    
    func customizeViewsForState(state: TableViewState) {
        
        switch state {
        case .noContent:
            tableView.backgroundView = noContentBackgroundView
        case .error:
            tableView.backgroundView = errorBackgroundView
        default:
            break
        }
        
    }

    

}
