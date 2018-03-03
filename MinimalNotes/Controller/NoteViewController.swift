//
//  NoteViewController.swift
//  MinimalNotes
//
//  Created by Leandro Pessini on 26/02/2018.
//  Copyright © 2018 Leandro Pessini. All rights reserved.
//

import UIKit

class NoteViewController: UIViewController {

    @IBOutlet weak var editTextView: UITextView!
    @IBOutlet weak var bottomBarView: UIView!
    @IBOutlet weak var sizeButton: UIButton!
    @IBOutlet weak var highlightButton: UIButton!
    @IBOutlet weak var boldButton: UIButton!
    @IBOutlet weak var alignButton: UIButton!
    @IBOutlet weak var bulletsButton: UIButton!
    @IBOutlet weak var bottomBarBottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        editTextView.delegate = self

        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(updateViewForKeyboard(notification:)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
        notificationCenter.addObserver(self, selector: #selector(updateViewForKeyboard(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)

    }

    @IBAction func closeButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }

    @objc func updateViewForKeyboard(notification: Notification) {
        let userInfo = notification.userInfo!
        let keyboardEndFrameScreenCoordinates = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let keyboardEndFrame = self.view.convert(keyboardEndFrameScreenCoordinates, to: view.window)

        if notification.name == Notification.Name.UIKeyboardWillHide {
            editTextView.contentInset = UIEdgeInsets.zero
            bottomBarBottomConstraint.constant = 0
        } else {
            editTextView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardEndFrame.height, right: 0)
            editTextView.scrollIndicatorInsets = editTextView.contentInset

            bottomBarBottomConstraint.constant = keyboardEndFrame.height
        }

        editTextView.scrollRangeToVisible(editTextView.selectedRange)

        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }

}

// MARK: - UITextView Delegate
extension NoteViewController: UITextViewDelegate {

    

}

