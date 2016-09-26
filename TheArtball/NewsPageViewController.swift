//
//  NewsPageViewController.swift
//  TheArtball
//
//  Created by Uros Zivaljevic on 9/24/16.
//  Copyright © 2016 Uros Zivaljevic. All rights reserved.
//

import UIKit

class NewsPageViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    
    var pagesDict = [Category: UIViewController]()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPageViewController()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Views setup
    
    func setupPageViewController() {
        let allNewsViewController = UIStoryboard(storyboardType: .News)
            .instantiateViewController(withIdentifier: ViewControllerID.kNewsCollectionViewController)
            as? NewsCollectionViewController
        allNewsViewController?.category = .all
        pagesDict[.all] = allNewsViewController
        dataSource = self
        setViewControllers([allNewsViewController!], direction: .forward, animated: true, completion: nil)
    }
    
    // MARK - Paging helper functions
    
    func setViewController(category: Category) {
        
        var nextViewController: UIViewController? = nil
        
        if let nextVC = pagesDict[category] {
            nextViewController = nextVC
        } else {
            let nextVC = UIStoryboard(storyboardType: .News)
                .instantiateViewController(withIdentifier: ViewControllerID.kNewsCollectionViewController)
                as? NewsCollectionViewController
            
            nextVC?.category = category
            pagesDict[category] = nextVC
            nextViewController = nextVC
        }
        let currentVC = viewControllers?.first as? NewsCollectionViewController
        
        var animationDirection = UIPageViewControllerNavigationDirection.forward
        
        if let currentCategory = currentVC?.category {
            if category < currentCategory {
                animationDirection = .reverse
            }
        }
        
        setViewControllers([nextViewController!], direction: animationDirection, animated: true, completion: nil)
    }
    
    func getViewController(category: Category?) -> UIViewController? {
        
        if let category = category {
            if let nextVC = pagesDict[category] {
                return nextVC
            } else {
                let nextVC = UIStoryboard(storyboardType: .News)
                    .instantiateViewController(withIdentifier: ViewControllerID.kNewsCollectionViewController)
                    as? NewsCollectionViewController
                nextVC?.category = category
                pagesDict[category] = nextVC
                return nextVC
            }
            
        }
        return nil
    }
    
    // MARK: - UIPageViewControllerDataSource
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        if let newsVC = viewController as? NewsCollectionViewController {
            return getViewController(category: newsVC.category?.next())
        }
        
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        if let newsVC = viewController as? NewsCollectionViewController {
            return getViewController(category: newsVC.category?.previous())
        }
        
        return nil
    }
    
}
