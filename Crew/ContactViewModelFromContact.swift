//
//  ContactViewModelFromContact.swift
//  Crew
//
//  Created by Danilo Soares Aliberti on 12/21/15.
//  Copyright © 2015 dsaliberti. All rights reserved.
//

import UIKit

class ContactViewModelFromContact: ContactProtocol {
    var contact: Contact
    
    let first_name: String
    let surname: String
    let address: String
    let phone_number: String
    let email: String
    let createdAt: String
    let updatedAt: String
    
    init(_ contact: Contact) {
        self.contact = contact
        
        self.first_name = contact.first_name
        self.surname = contact.surname
        self.address = contact.address
        self.phone_number = contact.phone_number
        self.email = contact.email
        
        //let dateFormatter = NSDateFormatter()
        //dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        //let createdAtDate :NSDate = dateFormatter.dateFromString(contact.createdAt)
        
        self.createdAt = contact.createdAt
        self.updatedAt = contact.updatedAt
        
    }
}