//
//  MenuTableViewControllerDelegate.swift
//  MinimalNotes
//
//  Created by Leandro Pessini on 28/02/2018.
//  Copyright © 2018 Leandro Pessini. All rights reserved.
//

import Foundation

protocol MenuDelegate: class {
    func didSelectMenuItem(_ index: Int)
}
