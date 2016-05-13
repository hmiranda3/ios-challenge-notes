//
//  EntryDetailViewController.swift
//  NotesChallenge
//
//  Created by Habib Miranda on 5/13/16.
//  Copyright © 2016 littleJohns. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController {

    @IBOutlet weak var bodyTextView: UITextView!
    
    var entry: Entry?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let entry = entry {
            updateWith(entry)
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func updateWith(entry: Entry) {
        bodyTextView.text = entry.bodyText
    }
    
    
    // MARK: - Action button

    @IBAction func saveButtonTapped(sender: AnyObject) {
        
        guard let entry = entry else {
            let NewEntry = Entry(timeStamp: NSDate(), bodyText: bodyTextView.text ?? "")
            EntryController.sharedController.addEntry(NewEntry)
            self.navigationController?.popToRootViewControllerAnimated(true)
            return
        }
        entry.bodyText = bodyTextView.text ?? ""
        
        self.navigationController?.popToRootViewControllerAnimated(true)
        EntryController.sharedController.saveFromPersistentStorage()
    }

}
