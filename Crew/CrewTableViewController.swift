//
//  CrewTableViewController.swift
//  Crew
//
//  Created by Danilo Soares Aliberti on 12/20/15.
//  Copyright © 2015 dsaliberti. All rights reserved.
//

import UIKit

class CrewTableViewController: UITableViewController {
    
    var crewFetcher: CrewFetcher?
    let defaults = NSUserDefaults.standardUserDefaults()
    let contactKey = "contacts"
    var contacts = [Contact]() {
        didSet {
            
//            let data = NSKeyedArchiver.archivedDataWithRootObject(contacts)
//            NSUserDefaults.standardUserDefaults().setObject(data, forKey: contactKey)
            
            tableView.reloadData()
        }
    }
    
//    func getSavedContacts() {
//        self.contacts = defaults.objectForKey(contactKey) as! [Contact]
//        self.tableView.reloadData()
//    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //self.getSavedContacts()
        
        crewFetcher?.fetch {
            if let contacts = $0 {
                self.contacts = contacts
                
            }
            else {
                let title = "Error"
                let message = "Cannot communicate with the server. Check wi-fi or cellular network settings."
                let dismiss = "Dismiss"
                let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
                alert.addAction(UIAlertAction(title: dismiss, style: .Default) { _ in
                    alert.dismissViewControllerAnimated(true, completion: nil)
                    })
                self.presentViewController(alert, animated: true, completion: nil)
            }
        }
    }
    
    // MARK: UITableViewDataSource
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        let contact = contacts[indexPath.row]
        cell.textLabel?.text = contact.first_name
        cell.detailTextLabel?.text = contact.surname
        return cell
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.showDetailsForContactAtIndexPath(indexPath)
    }
    func showDetailsForContactAtIndexPath(indexPath: NSIndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailViewController = storyboard.instantiateViewControllerWithIdentifier("detail") as! DetailContactViewController
        
        let contact = contacts[indexPath.row]
        let contactViewModel = ContactViewModelFromContact(contact)
        
        detailViewController.viewModel = contactViewModel
        
        self.navigationController?.pushViewController(detailViewController, animated: true)
        
    }
}





