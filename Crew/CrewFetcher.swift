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

struct CrewFetcher {
    let networking: NetworkingProtocol
    
    func fetch(response: [Contact]? -> ()) {
        
        networking.request { data in
            let contacts = data.map { self.decode($0) }
            response(contacts)
        }
    }
    
    private func decode(data: NSData) -> [Contact] {
        let json = JSON(data: data)
        var contacts = [Contact]()
        for (_, j) in json {
            if let id = j["id"].int {
                contacts.append(Contact(first_name: j["first_name"].string ?? "", surname: j["surname"].string ?? "", address: j["address"].string ?? "", phone_number: j["phone_number"].string ?? "", email: j["email"].string ?? "", id: id, createdAt: j["createdAt"].string ?? "", updatedAt: j["updatedAt"].string ?? ""))
            }
        }
        return contacts
    }
}
