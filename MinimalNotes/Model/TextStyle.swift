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

public struct TextStyle {

    func applyTextStyle(on selectedText: NSMutableAttributedString, with style: Int, at range: NSRange) -> NSMutableAttributedString? {

        if range.length > 0 { // there is any text selected

            let systemFont = UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)

            if let descriptor = systemFont.fontDescriptor.withSymbolicTraits([.traitBold]) {

                selectedText.setAttributes([.font: UIFont(descriptor: descriptor, size: systemFont.pointSize)], range: range)

            }

        } else {
            return nil
        }

        return selectedText

    }

}
