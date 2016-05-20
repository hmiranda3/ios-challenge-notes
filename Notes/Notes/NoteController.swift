//
//  NoteController.swift
//  Notes
//
//  Created by Habib Miranda on 5/20/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class NoteController {
    
    private let kNote = "noteKey"
    
    static let sharedController = NoteController()
    
    var notes: [Note] = []
    
    init() {
        loadDataFromPersitentStorage()
    }
    
    func addNote(note: String) {
        let note = Note(note: note)
        notes.append(note)
        saveNoteToPersitentStorage()
    }
    
    func deleteNote(note: Note) {
        if let index = notes.indexOf(note) {
            notes.removeAtIndex(index)
            saveNoteToPersitentStorage()
        }
    }
    
    func saveNoteToPersitentStorage() {
        NSUserDefaults.standardUserDefaults().setObject(notes.map{$0.dictionaryCopy}, forKey: kNote)
    }
    
    func loadDataFromPersitentStorage() {
        guard let noteToRetrieve = NSUserDefaults.standardUserDefaults().objectForKey(kNote) as? [[String: AnyObject]] else{
            return
        }
        self.notes = noteToRetrieve.flatMap{Note(dictionary : $0)}
    }
}