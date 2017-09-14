//
//  LoginViewController.swift
//  cleverbean
//
//  Created by Angus Johnston on 19/8/17.
//  Copyright © 2017 AAMSCO. All rights reserved.
//

import UIKit
import FirebaseAuth
import FacebookLogin
import FacebookCore


class LoginViewController: UIViewController, UITextFieldDelegate {

	@IBOutlet weak var facebookButton: CB_Button!
	@IBOutlet weak var googleButton: CB_Button!
	@IBOutlet weak var email: UITextField!
	@IBOutlet weak var password: UITextField!
	@IBOutlet weak var loginButton: CB_Button!
	
	var emailIsValid: Bool = false
	var passwordIsValid: Bool = false
	
	let firebaseAuth = FirebaseAuthentication()

	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		email.delegate = self
		password.delegate = self
		
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	@IBAction func emailChanged(_ sender: UITextField) {
		guard let string = sender.text else { return }
		//print("is email valid", emailIsValid)
	}
	
	
	@IBAction func passwordChanged(_ sender: UITextField) {
	}
	
	@IBAction func loginPressed(_ sender: CB_Button) {
		  if email.text != nil && password.text != nil {
			
			AuthService.instance.loginUser(withEmail: email.text!, andPassword: password.text!, loginComplete: { (success, loginError) in
				if success {
					self.dismiss(animated: true, completion: nil)
				} else {
					print(String(describing: loginError?.localizedDescription))
				}
				
				AuthService.instance.registerUser(withEmail: self.email.text!, andPassword: self.password.text!, userCreationComplete: { (success, registrationError) in
					if success {
						AuthService.instance.loginUser(withEmail: self.email.text!, andPassword: self.password.text!, loginComplete: { (success, nil) in
							self.dismiss(animated: true, completion: nil)
							print("Successfully registered user")
						})
					} else {
						print(String(describing: registrationError?.localizedDescription))
					}
				})
			})
		}
	}
	
	@IBAction func googleSignin(_ sender: CB_Button) {
		firebaseAuth.googleLogin()
	}
	
	@IBAction func facebookLogin(_ sender: CB_Button) {
		let loginManager = LoginManager()
		
		weak var weakSelf = self // ADD THIS LINE AS WELL

		loginManager.logIn([.publicProfile], viewController: self, completion: {[unowned self] loginResult in
			switch loginResult {
			case .failed(let error):
				print("ERROR!!!", error)
			case .cancelled:
				print("User cancelled login.")
			case .success(let grantedPermissions, let declinedPermissions, let accessToken):
				print("Logged in!")
				print("GRANTED PERMISSIONS:", grantedPermissions)
				print("DECLINED PERMISSIONS:", declinedPermissions)
				print("ACCESS TOKEN:", accessToken)

				//now login to Firebase using token
				self.firebaseAuth.loginToFirebase(token: accessToken.authenticationToken)

				self.performSegue(withIdentifier: "unwindSegueToVC1", sender: self)

			}
		})

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
