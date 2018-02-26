//
//  ContainerViewController.swift
//  MinimalNotes
//
//  Created by Leandro Pessini on 26/02/2018.
//  Copyright © 2018 Leandro Pessini. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {

    @IBOutlet weak var constraintMenuLeft: NSLayoutConstraint!
    @IBOutlet weak var constraintMenuWidth: NSLayoutConstraint!

    var sideMenuOpen = false

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(toogleSideMenu), name: NSNotification.Name("ToogleSideMenu"), object: nil)
    }

    @objc func toogleSideMenu() {
        if sideMenuOpen {
            constraintMenuLeft.constant = -300
        } else {
            constraintMenuLeft.constant = 0
        }
        sideMenuOpen = !sideMenuOpen
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }

}
