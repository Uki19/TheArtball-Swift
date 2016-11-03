//
//  PostCommentViewController.swift
//  TheArtball
//
//  Created by Uros Zivaljevic on 10/21/16.
//  Copyright © 2016 Uros Zivaljevic. All rights reserved.
//

import UIKit

class PostCommentViewController: UIViewController {

    @IBOutlet weak var postCommentView: UIView! {
        didSet {
            postCommentView.layer.borderColor = UIColor.artballColor.cgColor
            postCommentView.layer.borderWidth = 1.0
            postCommentView.layer.cornerRadius = 10.0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func cancelPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
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
