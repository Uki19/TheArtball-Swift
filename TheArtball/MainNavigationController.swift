//
//  MainNavigationController.swift
//  TheArtball
//
//  Created by Uros Zivaljevic on 10/13/16.
//  Copyright © 2016 Uros Zivaljevic. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //UINavigationBar Style
        navigationBar.tintColor = UIColor.white
        navigationBar.backgroundColor = UIColor.artballColor
        navigationBar.barTintColor = UIColor.artballColor
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        navigationBar.shadowImage = UIImage()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
