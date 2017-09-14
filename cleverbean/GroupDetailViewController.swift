//
//  GroupDetailViewController.swift
//  cleverbean
//
//  Created by Angus Johnston on 30/8/17.
//  Copyright © 2017 AAMSCO. All rights reserved.
//

import UIKit

class GroupDetailViewController: UIViewController {
	
	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var addGroupNote: CB_Button!
	@IBOutlet weak var searchStudents: UISearchBar!
	
	
	override func viewDidLoad() {
        super.viewDidLoad()
		

		tableView.layer.cornerRadius = 4

	}

	

}
