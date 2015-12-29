//
//  CrewFetcherSpec.swift
//  CrewTests
//
//  Created by Danilo Soares Aliberti on 12/19/15.
//  Copyright © 2015 dsaliberti. All rights reserved.
//

import Quick
import Nimble
import Swinject
@testable import Crew

class CrewFetcherSpec: QuickSpec {
    struct StubNetwork: NetworkingProtocol {
        private static let json =
        "[" +
            "{" +
                "\"first_name\": \"Danilo\"," +
                "\"surname\": \"S. Aliberti\"," +
                "\"address\": \"Vila Madalena Sao Paulo\"," +
                "\"phone_number\": \"+55 11 98983-8909\"," +
                "\"email\": \"dsaliberti@gmail.com\"," +
                "\"id\": 8033," +
                "\"createdAt\": \"2015-12-27T00:11:52.000Z\"," +
                "\"updatedAt\": \"2015-12-27T00:33:16.000Z" +
            "}," +
            
            "{" +
                "\"first_name\": \"Danilo2\"," +
                "\"surname\": \"S. Aliberti\"," +
                "\"address\": \"Vila Madalena Sao Paulo\"," +
                "\"phone_number\": \"+55 11 98983-8909\"," +
                "\"email\": \"dsaliberti@gmail.com\"," +
                "\"id\": 8034," +
                "\"createdAt\": \"2015-12-27T00:11:52.000Z\"," +
                "\"updatedAt\": \"2015-12-27T00:33:16.000Z" +
            "}" +
        "]"
        
        func request(response: NSData? -> ()) {
            let data = StubNetwork.json.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)
            
            response(data)
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    override func spec() {
        var container: Container!
        beforeEach {
            container = Container()
            
//            container.register(NetworkingProtocol.self, name: "stubNetwork") { _ in Network() }
//            container.register(CrewFetcher.self, name: "stubNetwork") { r in
//                CrewFetcher(networking: r.resolve(NetworkingProtocol.self, name: "stubNetwork")!)
//            }
            
            
            container.register(NetworkingProtocol.self, name: "stubNetwork") { _ in StubNetwork() }
            container.register(CrewFetcher.self, name: "stubFetcher") { r in
                CrewFetcher(networking: r.resolve(NetworkingProtocol.self, name: "stubNetwork")!)
            }
        }
        
        
        it("fills contact data correctly") {
            var contacts: [Contact]!
            let fetcher = container.resolve(CrewFetcher.self, name: "stubFetcher")!
            fetcher.fetch { contacts = $0 }
            expect(contacts?[0].id).toEventually(equal(8033))
            expect(contacts?[0].firstName).toEventually(equal("Danilo"))
            expect(contacts?[0].surname).toEventually(equal("S. Aliberti"))
            expect(contacts?[0].address).toEventually(equal("Vila Madalena Sao Paulo"))
            expect(contacts?[0].phoneNumber).toEventually(equal("+55 11 98983-8909"))
            expect(contacts?[0].email).toEventually(equal("dsaliberti@gmail.com"))
        }
        
        it("returns valid contacts") {
            var contacts: [Contact]!
            let fetcher = container.resolve(CrewFetcher.self, name: "stubFetcher")!
            fetcher.fetch { contacts = $0 }
            expect(contacts).toEventuallyNot(beNil())
            expect(contacts!.count).toEventually(beGreaterThan(0))
        }
        
    }
        
    
}
