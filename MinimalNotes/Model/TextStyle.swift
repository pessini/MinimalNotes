//
//  TextStyle.swift
//  MinimalNotes
//
//  Created by Leandro Pessini on 12/03/2018.
//  Copyright © 2018 Leandro Pessini. All rights reserved.
//

import UIKit

public enum StyleName: Int {

    case fontSize, bold, italic, align, bullets

    public var indexValue: Int {
        switch self {
            case .fontSize:
                return 0
            case .bold:
                return 1
            case .italic:
                return 2
            case .align:
                return 3
            case .bullets:
                return 4
        }
    }
}
