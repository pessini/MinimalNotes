//
//  MainViewController.swift
//  MinimalNotes
//
//  Created by Leandro Pessini on 26/02/2018.
//  Copyright © 2018 Leandro Pessini. All rights reserved.
//

import UIKit
import CoreData

protocol ToogleMenuDelegate: class {
    func toogleMenu()
}

class MainViewController: UIViewController {

    // MARK: - Variables
    weak var delegate: ToogleMenuDelegate?
    var notes: [Note] = []
    var fetchedResultController: NSFetchedResultsController<Note>!
    var labelMessageEmptyDB = UILabel()

    //MARK: - Outlets
    @IBOutlet weak var notesCollectionView: UICollectionView!

    // MARK: - View Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()

        labelMessageEmptyDB.text = "You don't have notes yet!"
        labelMessageEmptyDB.textAlignment = .center

        notesCollectionView.delegate = self
        notesCollectionView.dataSource = self
    }

    // MARK: - Actions
    @IBAction func onMenuButtonTapped(_ sender: UIBarButtonItem) {
        delegate?.toogleMenu()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "noteViewSegue" {
            if let noteVC = segue.destination as? NoteViewController {
                
            }
        }
    }


}

// MARK: - UICollectionViewDelegate e UICollectionViewDataSource
extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return notes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "noteCell", for: indexPath) as! NoteCollectionViewCell
        cell.noteLabel.text = "teste"

        return cell
    }
    
}

