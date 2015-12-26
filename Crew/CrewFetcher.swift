//
//  CrewFetcher.swift
//  Crew
//
//  Created by Danilo Soares Aliberti on 12/20/15.
//  Copyright © 2015 dsaliberti. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import RealmSwift

struct CrewFetcher {
    let networking: NetworkingProtocol
    
    func fetch(response: [Contact]? -> ()) {
        networking.request { data in
            let contacts = data.map { self.decode($0) }
            self.save(contacts!)
            response(contacts)
        }
    }
    func fetchLocal( response: [Contact]? -> () ){
        
        let realm = try! Realm()
        let results : Results<Contact> = realm.objects(Contact)
        var contacts : [Contact] = [Contact]()
        
        for result in results {
            let contact : Contact = (result)
            contacts.append(contact)
        }
        
        response ( contacts )
        
    }
    
    private func decode(data: NSData) -> [Contact] {
        let json = JSON(data: data)
        var contacts = [Contact]()
        var contact :Contact
        
        for (_, j) in json {
            
            contact = Contact()
            contact.firstName =     j["first_name"].stringValue
            contact.surname =       j["surname"].stringValue
            contact.address =       j["address"].string ?? ""
            contact.phoneNumber =   j["phone_number"].string ?? ""
            contact.email =         j["email"].string ?? ""
            contact.id =            j["id"].int!
            contact.createdAt =     j["createdAt"].string ?? ""
            contact.updatedAt =     j["updatedAt"].string ?? ""
            
            contacts.append(contact)
            
        }
        return contacts
    }
    func save(contacts:[Contact]){
        
        for contact in contacts {
            createOrUpdate(contact)
        }
        
    }
    
    func createOrUpdate(contact:Contact) {
        if let key = contact["id"] as? Int { contact.id = key }
        let realm = try! Realm()
        
        try! realm.write{
            realm.add(contact, update:true)
        }
    }
}
