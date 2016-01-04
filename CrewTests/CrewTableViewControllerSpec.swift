//
//  CrewTableViewControllerSpec.swift
//  CrewTests
//
//  Created by Danilo Soares Aliberti on 01/03/16.
//  Copyright © 2016 dsaliberti. All rights reserved.
//


import Quick
import Nimble
import RealmSwift

@testable import Crew

class CrewTableViewControllerSpec: QuickSpec {
    override func spec() {
        var viewController: CrewTableViewController!
        
        beforeEach {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            viewController = storyboard.instantiateViewControllerWithIdentifier("list") as! CrewTableViewController
        }
        
        describe(".viewDidLoad()") {
            
            var contact : Contact?
            
            beforeEach {
                
                contact = Contact ()
                contact?.id = 333;
                contact!.firstName = "Danilo Test View Controller"
                
                if let key = contact!["id"] as? Int { contact!.id = key }
                let realm = try! Realm()
                
                try! realm.write{
                    realm.deleteAll()
                    realm.add(contact!, update:true)
                }
                
                let _ =  viewController.view
            }
            
            it("viewController has a title") {
                expect(viewController.navigationItem.title).to(equal("Crew list"))
            }
            
            it("tableView has a row with a given object") {
                
                let path : NSIndexPath = NSIndexPath(forRow: 0, inSection: 0)
                let cell : UITableViewCell = viewController.tableView(viewController.tableView, cellForRowAtIndexPath: path )
                
                expect( cell.textLabel?.text ).to(equal( contact!.firstName ) )
                expect( cell.detailTextLabel?.text ).to(equal( contact!.surname ) )
                
            }
            
            it("tableView numberOfRows") {
                let rows = viewController.tableView.numberOfRowsInSection(0)
                expect(rows).to(equal(1))
                
            }
        }
    }
}











