//
//  AddStudentViewController.swift
//  cleverbean
//
//  Created by Angus Johnston on 8/9/17.
//  Copyright © 2017 AAMSCO. All rights reserved.
//

import UIKit

class AddStudentViewController: UIViewController {

	@IBOutlet weak var nameCard: Label_Text!
	
    override func viewDidLoad() {
        super.viewDidLoad()

		nameCard.title.text = "NAME"
		nameCard.inputField.placeholder = "Enter name..."
    }


}
