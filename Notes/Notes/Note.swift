//
//  Note.swift
//  Notes
//
//  Created by Habib Miranda on 5/20/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Note: Equatable {
    
    private let kNote = "noteKey"
    
    var note: String
    
    var dictionaryCopy: [String: AnyObject] {
        return[kNote: note]
    }
    
    init(note: String) {
        self.note = note
    }
    
    init?(dictionary: [String: AnyObject]) {
        guard let note = dictionary[kNote] as? String else {
            return nil
        }
        self.note = note
    }
    
}

func ==(lhs: Note, rhs: Note) -> Bool {
    return lhs.note == rhs.note
}