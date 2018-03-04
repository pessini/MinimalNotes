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

        loadNotes()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        notesCollectionView.reloadData()
    }

    // MARK: - Actions
    @IBAction func onMenuButtonTapped(_ sender: UIBarButtonItem) {
        delegate?.toogleMenu()
    }

    // MARK: - Prepare for Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "noteSegue" {
            if let noteVC = segue.destination as? NoteViewController {
                if let notes = fetchedResultController.fetchedObjects {
                    let cell = sender as! NoteCollectionViewCell
                    let indexPath = notesCollectionView.indexPath(for: cell)
                    noteVC.note = notes[(indexPath?.row)!]
                }
            }
        }
    }

    //MARK: - Get notes from the context

    func loadNotes(filtering: String = "") {
        let fetchRequest: NSFetchRequest<Note> = Note.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "title", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]

        if !filtering.isEmpty {
            let predicate = NSPredicate(format: "title contains [c] %@", filtering)
            fetchRequest.predicate = predicate
        }

        fetchedResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultController.delegate = self

        do {
            try fetchedResultController.performFetch()
        } catch {
            print(error.localizedDescription)
        }
    }

}

extension MainViewController: NSFetchedResultsControllerDelegate {

}

// MARK: - UICollectionViewDelegate e UICollectionViewDataSource
extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count = fetchedResultController.fetchedObjects?.count ?? 0
        notesCollectionView.backgroundView = count == 0 ? labelMessageEmptyDB : nil

        print(count)
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "noteCell", for: indexPath) as! NoteCollectionViewCell

        guard let note = fetchedResultController.fetchedObjects?[indexPath.row] else {
            return cell
        }

        cell.prepare(with: note)

        return cell
    }

}
