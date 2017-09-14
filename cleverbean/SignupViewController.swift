//
//  SignupViewController.swift
//  cleverbean
//
//  Created by Angus Johnston on 19/8/17.
//  Copyright © 2017 AAMSCO. All rights reserved.
//

import FirebaseCore
import FirebaseDatabase


class SignupViewController: UIViewController {
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
	}
	
	
	// when either button is tapped, an action is dispatched to the store
	// in order to update the application state
	@IBAction func downTouch(_ sender: AnyObject) {
		print("dispatching DECREASE")
	}
	
	@IBAction func upTouch(_ sender: AnyObject) {
		print("google..")
	}
	

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
