//
//  ContactViewModel.swift
//  Crew
//
//  Created by Danilo Soares Aliberti on 12/21/15.
//  Copyright © 2015 dsaliberti. All rights reserved.
//

import UIKit

class ContactViewModel: ContactProtocol {
    var contact: Contact
    
    var avatarImage: UIImage
    let avatarUrl: NSURL
    let placeholderImage: UIImage
    let imageRadius: CGFloat
    
    let firstName: String
    let surname: String
    let address: String
    let phoneNumber: String
    let email: String
    var createdAt: String
    var createdDate:NSDate
    var updatedAt: String
    var updatedDate:NSDate
    
    required init(contact: Contact) {
        self.contact = contact
        
        self.firstName = contact.firstName
        self.surname = contact.surname
        self.address = contact.address
        self.phoneNumber = contact.phoneNumber
        self.email = contact.email
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        self.createdAt = ""
        self.updatedAt = ""
        
        self.createdDate = NSDate()
        self.updatedDate = NSDate()
        
        if (!contact.createdAt.isEmpty) {
            self.createdAt = contact.createdAt
            self.createdDate = dateFormatter.dateFromString(self.createdAt)!
        }
        if (!contact.updatedAt.isEmpty) {
            self.updatedAt = contact.updatedAt
            self.updatedDate = dateFormatter.dateFromString(self.updatedAt)!
        }
        
        self.avatarImage = UIImage (named: "placeholder")!
        self.avatarUrl = NSURL( string : "http://api.adorable.io/avatars/500/\(self.contact.id).png" )!
        self.placeholderImage = UIImage(named: "placeholder")!
        self.imageRadius = 100
        
        
        
    }
    
    
}