//
//  ContainerViewController.swift
//  MinimalNotes
//
//  Created by Leandro Pessini on 28/02/2018.
//  Copyright © 2018 Leandro Pessini. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {

    @IBOutlet weak var constraintMenuLeft: NSLayoutConstraint!
    @IBOutlet weak var constraintMenuWidth: NSLayoutConstraint!

    var sideMenuOpen: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mainContainerEmbedSegue" {
            let navigationController = segue.destination as! UINavigationController
            let mainVC = navigationController.topViewController as! MainViewController
            mainVC.delegate = self
        } else if segue.identifier == "menuContainerEmbedSegue" {
            let menuVC = segue.destination as! MenuTableViewController
            menuVC.delegate = self
        }
    }

}

// MARK: - MainViewControllerDelegate

extension ContainerViewController: ToogleMenuDelegate {
    func toogleMenu() {
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

// MARK: - MenuTableViewControllerDelegate

extension ContainerViewController: MenuDelegate {
    func didSelectMenuItem(_ index: Int) {
        print(index)
    }
}
