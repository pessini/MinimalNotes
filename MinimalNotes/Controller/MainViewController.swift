//
//  MainViewController.swift
//  MinimalNotes
//
//  Created by Leandro Pessini on 26/02/2018.
//  Copyright © 2018 Leandro Pessini. All rights reserved.
//

import UIKit

protocol ToogleMenuDelegate: class {
    func toogleMenu()
}

class MainViewController: UIViewController {

    // MARK: - Variables
    weak var delegate: ToogleMenuDelegate?

    // MARK: - View Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Actions
    @IBAction func onMenuButtonTapped(_ sender: UIBarButtonItem) {
        delegate?.toogleMenu()
    }


}
