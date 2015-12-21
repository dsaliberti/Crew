//
//  NetworkingProtocol.swift
//  Crew
//
//  Created by Danilo Soares Aliberti on 12/20/15.
//  Copyright © 2015 dsaliberti. All rights reserved.
//

import Foundation

protocol NetworkingProtocol {
    func request(response: NSData? -> ())
}