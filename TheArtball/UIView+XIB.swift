//
//  UIView+XIB.swift
//  TheArtball
//
//  Created by Uros Zivaljevic on 9/26/16.
//  Copyright © 2016 Uros Zivaljevic. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    static func loadViewFromXib(name: String) -> UIView {
        
        let nib = UINib(nibName: name, bundle: Bundle.main)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    
}
