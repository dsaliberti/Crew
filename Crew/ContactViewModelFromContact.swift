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
    
    let firstName: String
    let surname: String
    let address: String
    let phoneNumber: String
    let email: String
    let createdAt: String
    let updatedAt: String
    
    required init(contact: Contact) {
        self.contact = contact
        
        self.firstName = contact.firstName
        self.surname = contact.surname
        self.address = contact.address
        self.phoneNumber = contact.phoneNumber
        self.email = contact.email
        
        //let dateFormatter = NSDateFormatter()
        //dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        //let createdAtDate :NSDate = dateFormatter.dateFromString(contact.createdAt)
        
        self.createdAt = contact.createdAt
        self.updatedAt = contact.updatedAt
        
    }
}