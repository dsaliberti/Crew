//
//  Contact.swift
//  Crew
//
//  Created by Danilo Soares Aliberti on 12/20/15.
//  Copyright © 2015 dsaliberti. All rights reserved.
//

import RealmSwift

class Contact: Object {
    
    dynamic var firstName : String = ""
    dynamic var surname : String = ""
    dynamic var address : String = ""
    dynamic var phoneNumber : String = ""
    dynamic var email : String = ""
    dynamic var id : Int = 0
    dynamic var createdAt : String = ""
    dynamic var updatedAt : String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
}