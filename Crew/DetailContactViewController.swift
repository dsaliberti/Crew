//
//  DetailContactViewController.swift
//  Crew
//
//  Created by Danilo Soares Aliberti on 12/21/15.
//  Copyright © 2015 dsaliberti. All rights reserved.
//

import UIKit

class DetailContactViewController: UIViewController {
    
    @IBOutlet var firstName: UILabel!
    @IBOutlet var surName: UILabel!
    @IBOutlet var address: UILabel!
    @IBOutlet var phoneNumber: UILabel!
    @IBOutlet var email: UILabel!
    @IBOutlet var createdAt: UILabel!
    @IBOutlet var updatedAt: UILabel!
    
    var viewModel : ContactViewModelFromContact!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.firstName.text = viewModel.first_name
        self.surName.text = viewModel.surname
        self.address.text = viewModel.address
        self.phoneNumber.text = viewModel.phone_number
        self.email.text = viewModel.email
        
        self.createdAt.text = viewModel.createdAt
        self.updatedAt.text = viewModel.updatedAt
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
}
