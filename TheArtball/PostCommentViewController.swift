//
//  PostCommentViewController.swift
//  TheArtball
//
//  Created by Uros Zivaljevic on 10/21/16.
//  Copyright © 2016 Uros Zivaljevic. All rights reserved.
//

import UIKit

class PostCommentViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var commentTextView: UITextView! {
        didSet {
            commentTextView.delegate = self
            commentTextView.textContainerInset = UIEdgeInsets.zero
            commentTextView.contentInset = UIEdgeInsets.zero
        }
    }
    @IBOutlet weak var commentPlaceholderLabel: UILabel!
    @IBOutlet weak var postViewCenterYConstraint: NSLayoutConstraint!
    @IBOutlet weak var backgroundView: UIView! {
        didSet {
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(backgroundViewTapped(_:)))
            backgroundView.addGestureRecognizer(tapGestureRecognizer)
        }
        
    }
    @IBOutlet weak var postCommentView: UIView! {
        didSet {
            postCommentView.layer.cornerRadius = 10.0
            postCommentView.layer.shadowColor = UIColor.black.cgColor
            postCommentView.layer.shadowRadius = 1
            postCommentView.layer.shadowOffset = CGSize(width: 1, height: 1);
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(postCommentViewTapped(_:)))
            postCommentView.addGestureRecognizer(tapGestureRecognizer)
        }
    }
    
    var keyboardOffset: CGFloat = 0.0
    let STANDARD_PADDING: CGFloat = 8.0
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerLocalNotifications()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    //MARK: - NSNotifications
    
    func registerLocalNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardNotification(_:)), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardNotification(_:)), name: .UIKeyboardWillHide, object: nil)
    }
    
    func unregisterLocalNotifications() {
        NotificationCenter.default.removeObserver(self)
    }
    
    @IBAction func cancelPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func backgroundViewTapped(_ sender: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
    
    func postCommentViewTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    //MARK: - UITextView Delegate
    
    func textViewDidChange(_ textView: UITextView) {
        commentPlaceholderLabel.isHidden = (textView.text.characters.count != 0)
    }
    
    //MARK: - Keyboard handling
    
    func handleKeyboardNotification(_ notification: Notification) {
        
        let userInfo = notification.userInfo
        if let keyboardFrame = userInfo?[UIKeyboardFrameEndUserInfoKey] as? CGRect,
            let animationType = userInfo?[UIKeyboardAnimationCurveUserInfoKey] as? UInt,
            let animationDuration = userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? Double {
            
            if notification.name == .UIKeyboardWillShow {
                
                let offset = postCommentView.frame.maxY - keyboardFrame.origin.y
                if offset > 0 {
                    keyboardOffset = offset
                    UIView.animate(withDuration: animationDuration,
                                   delay: 0.0,
                                   options: UIViewAnimationOptions(rawValue: animationType),
                                   animations: {
                                    self.postViewCenterYConstraint.constant -= self.keyboardOffset + self.STANDARD_PADDING
                                    self.view.layoutIfNeeded()
                    })
                }
            } else if notification.name == .UIKeyboardWillHide {
                UIView.animate(withDuration: animationDuration,
                               delay: 0.0,
                               options: UIViewAnimationOptions(rawValue: animationType),
                               animations: {
                                self.postViewCenterYConstraint.constant += self.keyboardOffset + self.STANDARD_PADDING
                                self.view.layoutIfNeeded()
                })
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
