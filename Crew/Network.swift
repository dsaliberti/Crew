//
//  Network.swift
//  Crew
//
//  Created by Danilo Soares Aliberti on 12/20/15.
//  Copyright © 2015 dsaliberti. All rights reserved.
//

import Foundation
import Alamofire

struct Network : NetworkingProtocol {
    func request(response: NSData? -> ()) {
        Alamofire.request(.GET, ContactsMap.url )
            .response { _, _, data, error in
                if let error = error {
                    print("Failed with error: \(error)")
                } else {
                    response(data)
                }
        }
    }
    
}

