//
//  ViewController.swift
//  cleverbean
//
//  Created by Angus Johnston on 18/8/17.
//  Copyright © 2017 AAMSCO. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
	}
	

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		// Hide the navigation bar on the this view controller
		self.navigationController?.setNavigationBarHidden(true, animated: animated)
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		
		// Show the navigation bar on other view controllers
		self.navigationController?.setNavigationBarHidden(false, animated: animated)
	}

}

