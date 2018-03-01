//
//  MenuItems.swift
//  MinimalNotes
//
//  Created by Leandro Pessini on 01/03/2018.
//  Copyright © 2018 Leandro Pessini. All rights reserved.
//

import Foundation

struct MenuItems {

    let itemName: String

    init(itemName: String) {
        self.itemName = itemName
    }

    static func allItems() -> Array<String> {
        return ["Notes", "Apps", "Profile", "Exit"]
    }
}
