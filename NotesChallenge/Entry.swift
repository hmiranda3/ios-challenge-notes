//
//  Entry.swift
//  NotesChallenge
//
//  Created by Habib Miranda on 5/13/16.
//  Copyright © 2016 littleJohns. All rights reserved.
//

import Foundation

class Entry: Equatable {
    
    private let timeStampKey = "timeStamp"
    private let bodyTextKey = "bodyText"
    
    var timeStamp: NSDate
    var bodyText: String
    
    var dictionaryCopy: [String: AnyObject] {
        return[timeStampKey: timeStamp, bodyTextKey: bodyText]
    }
    
    init(timeStamp: NSDate, bodyText: String) {
        
        self.timeStamp = timeStamp
        self.bodyText = bodyText
    }
    
    init?(dictionary: [String: AnyObject]) {
        guard let timeStamp = dictionary[timeStampKey] as? NSDate, let bodyTextDictionaries = dictionary[bodyTextKey] as? String else {
            return nil
        }
        
        self.timeStamp = timeStamp
        self.bodyText = bodyTextDictionaries
    }
}

func ==(lhs: Entry, rhs: Entry) -> Bool {
    return(lhs.timeStamp == rhs.timeStamp && lhs.bodyText == rhs.bodyText)
}

