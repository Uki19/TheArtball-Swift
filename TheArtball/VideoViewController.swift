//
//  VideoViewController.swift
//  TheArtball
//
//  Created by Uros Zivaljevic on 10/15/16.
//  Copyright © 2016 Uros Zivaljevic. All rights reserved.
//

import UIKit

class VideoViewController: UIViewController {

    @IBOutlet weak var videoView: YTPlayerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func closeButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
