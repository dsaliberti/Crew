//
//  SwinjectStoryboard+Setup.swift
//  Crew
//
//  Created by Danilo Soares Aliberti on 12/20/15.
//  Copyright © 2015 dsaliberti. All rights reserved.
//

import Swinject

extension SwinjectStoryboard {
    class func setup() {
        defaultContainer.registerForStoryboard(CrewTableViewController.self) { r, c in
            c.crewFetcher = r.resolve(CrewFetcher.self)
        }
        defaultContainer.register(NetworkingProtocol.self) { _ in Network() }
        defaultContainer.register(CrewFetcher.self) { r in
            CrewFetcher(networking: r.resolve(NetworkingProtocol.self)!)
        }
    }
}
