//
//  NoteEntryViewController.swift
//  Notes
//
//  Created by Habib Miranda on 5/20/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class NoteEntryViewController: UIViewController {

    @IBOutlet weak var noteBodyText: UITextView!
    
    var note: Note?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let note = note {
            updateWith(note)
        }
    }
    
    func updateWith(note: Note) {
        noteBodyText.text = note.note
    }
    
    //MARK: -Action Buttons
    
    @IBAction func saveButtonTapped(sender: AnyObject) {
        guard let note = note else {
            if let noteText = noteBodyText.text where noteText.characters.count > 0 {
                NoteController.sharedController.addNote(noteText)
                navigationController?.popToRootViewControllerAnimated(true)
            }
            return
        }
        note.note = noteBodyText.text ?? ""
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    

    @IBAction func clearButtonTapped(sender: AnyObject) {
        noteBodyText.text = ""
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
