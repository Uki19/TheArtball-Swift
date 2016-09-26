//
//  NewsMainViewController.swift
//  TheArtball
//
//  Created by Uros Zivaljevic on 9/24/16.
//  Copyright © 2016 Uros Zivaljevic. All rights reserved.
//

import UIKit

class NewsMainViewController: UIViewController, UIPageViewControllerDelegate {

    @IBOutlet weak var categoriesSegmentedControl: UISegmentedControl!
    @IBOutlet weak var newsPagesHolderView: UIView!
    var newsPageViewController: NewsPageViewController?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPagesView()
        setupSegmentedControl()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    // MARK: - Views setup 
    
    func setupPagesView() {
        newsPageViewController = UIStoryboard(storyboardType: .News)
            .instantiateViewController(withIdentifier: ViewControllerID.kNewsPageViewController)
            as? NewsPageViewController
        addChildViewController(newsPageViewController!)
        newsPageViewController?.view.frame = newsPagesHolderView.bounds
        newsPageViewController?.delegate = self
        newsPagesHolderView.addSubview(newsPageViewController!.view)
        newsPageViewController?.didMove(toParentViewController: self)
        
    }
    
    func setupSegmentedControl() {
        
        categoriesSegmentedControl.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.white], for: .normal)
        categoriesSegmentedControl.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.white], for: .selected)
        categoriesSegmentedControl.tintColor = UIColor.clear
        categoriesSegmentedControl.setBackgroundImage(#imageLiteral(resourceName: "segment-select"), for: .selected, barMetrics: .default)
        categoriesSegmentedControl.setBackgroundImage(#imageLiteral(resourceName: "segmented-unselected"), for: .normal, barMetrics: .default)
        
    }
    
    @IBAction func categorySegmentTapped(_ sender: UISegmentedControl) {
        
        newsPageViewController?.setViewController(category: Category(rawValue: sender.selectedSegmentIndex)!)
        
    }

    // MARK: - UIPageViewControllerDelegate
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            if let currentPageVC = pageViewController.viewControllers?.first as? NewsCollectionViewController {
                if let currentCategory = currentPageVC.category {
                    categoriesSegmentedControl.selectedSegmentIndex = currentCategory.rawValue
                }
                
            }
        }
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
