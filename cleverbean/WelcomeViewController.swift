//
//  WelcomeViewController.swift
//  cleverbean
//
//  Created by Angus Johnston on 27/8/17.
//  Copyright © 2017 AAMSCO. All rights reserved.
//

import UIKit
import Firebase


class WelcomeViewController: UIViewController {

	@IBOutlet weak var addClassView: CB_UIView!
	@IBOutlet weak var studentsButton: CB_UIView!
	
    override func viewDidLoad() {
        super.viewDidLoad()

		// here we instantiate an object of gesture recognizer
		let gestureRec = UITapGestureRecognizer(target: self, action:  #selector (self.tappedGroups (_:)))
		addClassView.addGestureRecognizer(gestureRec)

		let studentsButtonGestureRec = UITapGestureRecognizer(target: self, action:  #selector (self.tappedStudentsButton (_:)))
		studentsButton.addGestureRecognizer(studentsButtonGestureRec)
		
	}
	
	override var prefersStatusBarHidden: Bool {
		return true
	}

	func tappedGroups(_ sender:UITapGestureRecognizer){
		_ = self.tabBarController?.selectedIndex = 1
		
	}

	func tappedStudentsButton(_ sender:UITapGestureRecognizer){
		_ = self.tabBarController?.selectedIndex = 2	
	}
	
	@IBAction func testLogout(_ sender: UIButton) {
		
		let logoutPopup = UIAlertController(title: "Logout?", message: "Are you sure you want to logout?", preferredStyle: .actionSheet)
		let logoutAction = UIAlertAction(title: "Logout?", style: .destructive) { (buttonTapped) in
			do {
				try Auth.auth().signOut()
				let authVC = self.storyboard?.instantiateViewController(withIdentifier: "start") as? MainAuthViewController
				self.present(authVC!, animated: true, completion: nil)
			} catch {
				print(error)
			}
		}
		logoutPopup.addAction(logoutAction)
		present(logoutPopup, animated: true, completion: nil)
	}


}
