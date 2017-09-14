//
//  AuthService.swift
//  cleverbean
//
//  Created by Angus Johnston on 24/8/17.
//  Copyright © 2017 AAMSCO. All rights reserved.
//

import Foundation
import FirebaseAuth

class AuthService {
	static let instance = AuthService()
	
	func registerUser(withEmail email: String, andPassword password : String, userCreationComplete: @escaping (_ status: Bool, _ error: Error?) -> ()) {
		Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
			guard let user = user else {
				userCreationComplete(false, error)
				return
			}
			
			
			let userData = [
				"provider": user.providerID,
				"email": user.email,
				"displayName": user.displayName,
				"emailVerified": user.isEmailVerified.description,
				"isAnonymous": user.isAnonymous.description,
				"refreshToken": user.refreshToken,
				"uid": user.uid
			]
			DataService.instance.createDBUser(uid: user.uid, userData: userData)
			userCreationComplete(true, nil)
		}
	}
	
	func loginUser(withEmail email: String, andPassword password : String, loginComplete: @escaping (_ status: Bool, _
		error: Error?) -> ()) {
		
		Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
			guard let user = user else {
				loginComplete(false, error)
				return
			}
			loginComplete(true, nil)
		}
		
	}
	
}
