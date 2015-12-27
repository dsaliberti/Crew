//
//  CrewTableViewController.swift
//  Crew
//
//  Created by Danilo Soares Aliberti on 12/20/15.
//  Copyright © 2015 dsaliberti. All rights reserved.
//

import UIKit
import AlamofireImage

class CrewTableViewController: UITableViewController {
    
    var crewFetcher: CrewFetcher?
    var contacts = [Contact]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        crewFetcher?.fetchLocal {
            
            if let contacts = $0 {
                self.contacts = contacts
                
            }
            else {
                
            }
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
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
        let contactViewModel = ContactViewModel(contact: contact)
        
        cell.textLabel?.text = contactViewModel.firstName
        cell.detailTextLabel?.text = contactViewModel.surname
        cell.imageView?.af_setImageWithURL(contactViewModel.avatarUrl,
            placeholderImage: contactViewModel.placeholderImage,
            filter: RoundedCornersFilter (
                radius: contactViewModel.imageRadius
            ),
            imageTransition: .CrossDissolve(1),
            completion: { (response) -> Void in
        })
        
        return cell
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.showDetailsForContactAtIndexPath(indexPath)
    }
    func showDetailsForContactAtIndexPath(indexPath: NSIndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailViewController = storyboard.instantiateViewControllerWithIdentifier("detail") as! DetailContactViewController
        
        let contact = contacts[indexPath.row]
        let contactViewModel = ContactViewModel(contact: contact)
        
        detailViewController.viewModel = contactViewModel
        
        self.navigationController?.pushViewController(detailViewController, animated: true)
        
    }
}






