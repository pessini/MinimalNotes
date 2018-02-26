//
//  NoteViewController.swift
//  MinimalNotes
//
//  Created by Leandro Pessini on 26/02/2018.
//  Copyright © 2018 Leandro Pessini. All rights reserved.
//

import UIKit

class NoteViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }



}
