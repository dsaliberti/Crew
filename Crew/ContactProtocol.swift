//
//  ContactProtocol.swift
//  Crew
//
//  Created by Danilo Soares Aliberti on 12/21/15.
//  Copyright © 2015 dsaliberti. All rights reserved.
//

import Foundation

protocol ContactProtocol {
    var first_name : String { get }
    var surname : String { get }
    var address : String { get }
    var phone_number : String { get }
    var email : String { get }
    var createdAt : String { get }
    var updatedAt : String { get }
}
