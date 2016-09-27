//
//  BaseCollectionViewController.swift
//  TheArtball
//
//  Created by Uros Zivaljevic on 9/27/16.
//  Copyright © 2016 Uros Zivaljevic. All rights reserved.
//

import UIKit

class BaseCollectionViewController: UICollectionViewController {
    
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
            collectionView?.backgroundView = nil
        case .loading:
            collectionView?.backgroundView = loadingBackgroundView
        case .noContent:
            collectionView?.backgroundView = noContentBackgroundView
        case .error:
            collectionView?.backgroundView = errorBackgroundView
        }
        
    }
    
    
}
