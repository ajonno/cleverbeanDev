//
//  FirebaseAuthentication.swift
//  cleverbean
//
//  Created by Angus Johnston on 21/8/17.
//  Copyright © 2017 AAMSCO. All rights reserved.
//

import FirebaseAuth
import GoogleSignIn

class FirebaseAuthentication: UIViewController, GIDSignInUIDelegate {
	
	func loginWithEmail(email: String, password: String) {
		_ = self.validateEmail(email: email)
	}
	
	
	func googleLogin() {
		GIDSignIn.sharedInstance().uiDelegate = self
		GIDSignIn.sharedInstance().signIn()
		
		//the success/fail callback is in AppDelegate
	}
	
	func validateEmail(email: String) -> Bool {
		var returnValue = true
		let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
		
		do {
			let regex = try NSRegularExpression(pattern: emailRegEx)
			let nsString = email as NSString
			let results = regex.matches(in: email, range: NSRange(location: 0, length: nsString.length))
			
			if results.count == 0
			{
				returnValue = false
			}
			
		} catch let error as NSError {
			print("invalid regex: \(error.localizedDescription)")
			returnValue = false
		}
		
		return  returnValue
	}
	
	func loginToFirebase(token: String)  {
		let credential = FacebookAuthProvider.credential(withAccessToken: token)

		Auth.auth().signIn(with: credential) { (user, error) in
			if let error = error {
				print("ERROR !!", error)
				return
			}
			print("user is", user!)

		}
	}
		
}


