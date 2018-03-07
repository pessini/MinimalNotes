//
//  NoteCollectionViewCell.swift
//  MinimalNotes
//
//  Created by Leandro Pessini on 04/03/2018.
//  Copyright © 2018 Leandro Pessini. All rights reserved.
//

import UIKit

class NoteCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var noteLabel: UILabel!
    
    func prepare(with note: Note) {

        noteLabel.text = note.text as? String ?? ""
        print(note.text?.description as Any, "\n")

    }
}
