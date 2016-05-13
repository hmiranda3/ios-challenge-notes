//
//  EntryController.swift
//  NotesChallenge
//
//  Created by Habib Miranda on 5/13/16.
//  Copyright © 2016 littleJohns. All rights reserved.
//

import Foundation

class EntryController {
    
    static var sharedController = EntryController()
    
    var entries = [Entry]()
    
    
    
    func addEntry(entry: Entry) {
        entries.append(entry)
        //here we will add a saveToPersistantCode
    }
    
    func removeEntry(entry: Entry) {
        guard let indexOfEntry = entries.indexOf(entry) else {
            return
        }
        entries.removeAtIndex(indexOfEntry)
        //Here we will add a saveToPersistentCode
    }
}






