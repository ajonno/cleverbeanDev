//
//  MainTabBarViewController.swift
//  cleverbean
//
//  Created by Angus Johnston on 22/8/17.
//  Copyright © 2017 AAMSCO. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

		self.tabBar.frame.size.width = self.view.frame.width + 4
		self.tabBar.frame.origin.x = -2
		self.tabBar.barTintColor = .white
	}
	
	override func viewDidAppear(_ animated: Bool) {
		//is user logged in?

	}
	

}
