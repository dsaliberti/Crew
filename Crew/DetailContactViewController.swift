//
//  DetailContactViewController.swift
//  Crew
//
//  Created by Danilo Soares Aliberti on 12/21/15.
//  Copyright © 2015 dsaliberti. All rights reserved.
//

import UIKit
import AlamofireImage

class DetailContactViewController: UIViewController {
    
    @IBOutlet var firstName: UILabel!
    @IBOutlet var surName: UILabel!
    @IBOutlet var address: UILabel!
    @IBOutlet var phoneNumber: UILabel!
    @IBOutlet var email: UILabel!
    @IBOutlet var createdAt: UILabel!
    @IBOutlet var updatedAt: UILabel!
    
    @IBOutlet var avatarImage: UIImageView!
    var viewModel : ContactViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.firstName.text = viewModel.firstName
        self.surName.text = viewModel.surname
        self.address.text = viewModel.address
        self.phoneNumber.text = viewModel.phoneNumber
        self.email.text = viewModel.email
        
        self.createdAt.text = viewModel.createdAt
        self.updatedAt.text = viewModel.updatedAt
        
        self.avatarImage?.af_setImageWithURL(viewModel.avatarUrl,
            placeholderImage: viewModel.placeholderImage,
            filter: RoundedCornersFilter (
                radius: viewModel.imageRadius
            ),
            imageTransition: .CrossDissolve(1),
            completion: { (response) -> Void in
        })
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
}
