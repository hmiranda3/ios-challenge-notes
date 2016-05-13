//
//  EntryController.swift
//  NotesChallenge
//
//  Created by Habib Miranda on 5/13/16.
//  Copyright © 2016 littleJohns. All rights reserved.
//

import Foundation

class EntryController {
    
    private let entryKey = "entry"
    
    static var sharedController = EntryController()
    
    var entries = [Entry]()
    
    init() {
        loadFromPersistentStore()
    }
    
    func addEntry(entry: Entry) {
        entries.append(entry)
        saveFromPersistentStorage()
    }
    
    func removeEntry(entry: Entry) {
        guard let indexOfEntry = entries.indexOf(entry) else {
            return
        }
        entries.removeAtIndex(indexOfEntry)
        saveFromPersistentStorage()
    }
    
    func saveFromPersistentStorage() {
        NSUserDefaults.standardUserDefaults().setObject(entries.map({$0.dictionaryCopy}), forKey: entryKey)
    }
    
    func loadFromPersistentStore() {
        guard let entryDictionary = NSUserDefaults.standardUserDefaults().objectForKey(entryKey) as? [[String: AnyObject]] else {
            return
        }
        entries = entryDictionary.flatMap({Entry(dictionary: $0)})
    }
}






