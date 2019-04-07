//
//  NoteViewController.swift
//  MinimalNotes
//
//  Created by Leandro Pessini on 26/02/2018.
//  Copyright © 2018 Leandro Pessini. All rights reserved.
//

import UIKit

class NoteViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var noteTextView: UITextView!
    @IBOutlet weak var toolBar: UIToolbar!
    @IBOutlet weak var toolBarBottomConstraint: NSLayoutConstraint!

    // MARK: - Variables
    var note: Note!

    // MARK: - view life cycles
    override func viewDidLoad() {
        super.viewDidLoad()

        noteTextView.delegate = self

        setupBarButtonItems()

        // adding observer to get when the keyboard will show or hide

        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(updateViewForKeyboard(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(updateViewForKeyboard(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)

    }

    func setupBarButtonItems() {

        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)

        let changeFontSize = UIBarButtonItem(title: "Size", style: .plain, target: self, action: #selector(applyStyle))
        changeFontSize.tag = 0

        let makeBold = UIBarButtonItem(title: "B", style: .plain, target: self, action: #selector(applyStyle))
        makeBold.tag = StyleName.bold.indexValue

        let makeItalic = UIBarButtonItem(title: "I", style: .plain, target: self, action: #selector(applyStyle))
        makeItalic.tag = StyleName.italic.indexValue

        let alignText = UIBarButtonItem(title: "Align", style: .plain, target: self, action: #selector(applyStyle))
        alignText.tag = StyleName.align.indexValue

        let applyBullets = UIBarButtonItem(title: "Bullets", style: .plain, target: self, action: #selector(applyStyle))
        applyBullets.tag = StyleName.bullets.indexValue

        toolBar.items?.append(flexibleSpace)
        toolBar.items?.append(changeFontSize)
        toolBar.items?.append(makeBold)
        toolBar.items?.append(makeItalic)
        toolBar.items?.append(alignText)
        toolBar.items?.append(applyBullets)
        toolBar.items?.append(flexibleSpace)
    }

    @objc func applyStyle(sender: UIBarButtonItem){
        
        let range: NSRange = noteTextView.selectedRange

        let systemFont = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body)

        let descriptor = systemFont.fontDescriptor.withSymbolicTraits([.traitBold, .traitItalic])

//        let attributes: [NSAttributedStringKey : Any] =
//            [.paragraphStyle: paragraphStyle,
//             .foregroundColor: UIColor.purple,
//             .font: UIFont(name: "Papya", size:20) ??
//                UIFont.systemFont(ofSize: 20),
//             .underlineColor: UIColor.purple,
//             .underlineStyle: NSUnderlineStyle.styleSingle.rawValue]

        noteTextView.textStorage.beginEditing()
        noteTextView.textStorage.setAttributes([.font: UIFont(descriptor: descriptor!, size: systemFont.pointSize)], range: range)
        noteTextView.textStorage.endEditing()

    }

    @IBAction func closeButtonTapped(_ sender: UIButton) {

        if note == nil {
            note = Note(context: context)
        }

        note.title = "Padrão"
        note.dateAdded = Date()
//        note.text = "" as NSObject

        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }

        dismiss(animated: true, completion: nil)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }

    // MARK: - Keyboard will show or hide

    @objc func updateViewForKeyboard(notification: Notification) {

        let userInfo = notification.userInfo!
        let keyboardEndFrameScreenCoordinates = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let keyboardEndFrame = self.view.convert(keyboardEndFrameScreenCoordinates, to: view.window)

        if notification.name == UIResponder.keyboardWillHideNotification {
            noteTextView.contentInset = UIEdgeInsets.zero
            toolBarBottomConstraint.constant = 0
        } else {
            noteTextView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardEndFrame.height, right: 0)
            noteTextView.scrollIndicatorInsets = noteTextView.contentInset

            toolBarBottomConstraint.constant = keyboardEndFrame.height
        }

        noteTextView.scrollRangeToVisible(noteTextView.selectedRange)

        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }

}

extension UIFont{

    func withTraits(traits:UIFontDescriptor.SymbolicTraits...) -> UIFont {
        let descriptor = self.fontDescriptor
            .withSymbolicTraits(UIFontDescriptor.SymbolicTraits(traits))
        return UIFont(descriptor: descriptor!, size: 0)
    }

    func bold() -> UIFont {
        return withTraits(traits: .traitBold)
    }
}

// MARK: - UITextView Delegate
extension NoteViewController: UITextViewDelegate {

    

}

