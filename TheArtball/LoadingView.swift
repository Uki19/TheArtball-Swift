//
//  LoadingView.swift
//  TheArtball
//
//  Created by Uros Zivaljevic on 9/27/16.
//  Copyright © 2016 Uros Zivaljevic. All rights reserved.
//

import UIKit

class LoadingView: UIView {

    var logoImageView: UIImageView!
    
    init() {
        super.init(frame: CGRect.zero)
        logoImageView = UIImageView(image: #imageLiteral(resourceName: "loading"))
        addSubview(logoImageView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        logoImageView.center = center
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func startLoading() {
        UIView.animate(withDuration: 1.0, delay: 0, options: [.repeat, .autoreverse], animations: {
            self.logoImageView.alpha = abs(self.logoImageView.alpha - 1.0)
            }, completion: nil)
    }

    func stopLoading() {
        logoImageView.layer.removeAllAnimations()
    }
    
}
