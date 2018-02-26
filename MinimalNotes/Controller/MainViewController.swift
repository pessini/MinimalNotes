//
//  MainViewController.swift
//  MinimalNotes
//
//  Created by Leandro Pessini on 26/02/2018.
//  Copyright © 2018 Leandro Pessini. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func onMenuButtonTapped(_ sender: UIBarButtonItem) {
        NotificationCenter.default.post(name: NSNotification.Name("ToogleSideMenu"), object: nil)
        
    }


}
