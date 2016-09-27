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
        didSet {
            customizeViewsForState(state: currentState)
        }
    }
    
    var errorBackgroundView: StatusView = {
        let statusView = UIView.loadViewFromXib(name:"StatusView") as! StatusView
        statusView.statusLabel.text = "An Error Occured, please try later"
        return statusView
    }()
    
    var noContentBackgroundView: StatusView = {
        let statusView = UIView.loadViewFromXib(name:"StatusView") as! StatusView
        statusView.statusLabel.text = "No Data"
        return statusView
    }()
    
    func customizeViewsForState(state: DataViewState) {
        
        switch state {
        case .filled:
            tableView.backgroundView = nil
        case .noContent:
            tableView.backgroundView = noContentBackgroundView
        case .error:
            tableView.backgroundView = errorBackgroundView
        default:
            break
        }
        
    }

}
