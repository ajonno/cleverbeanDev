//
//  DataService.swift
//  cleverbean
//
//  Created by Angus Johnston on 24/8/17.
//  Copyright © 2017 AAMSCO. All rights reserved.
//

import Foundation
import Firebase

let DB_BASE = Database.database().reference()

class DataService {
	
	static let instance = DataService()
	
	private var _REF_BASE = DB_BASE
	
	private var _REF_USERS = DB_BASE.child("users")
	private var _REF_READING_LEVELS = DB_BASE.child("cleverbeanReadingLevels")
	private var _REF_STRATEGY_LEVELS = DB_BASE.child("cleverbeanStrategyLevels")
	private var _REF_STRATEGY_TIPS = DB_BASE.child("cleverbeanStrategyTips")
	
	var REF_BASE: DatabaseReference {
		return _REF_BASE
	}

	var REF_USERS: DatabaseReference {
		return _REF_USERS
	}
	
	var REF_READING_LEVELS: DatabaseReference {
		return _REF_READING_LEVELS
	}
	
	var REF_STRATEGY_LEVELS: DatabaseReference {
		return _REF_STRATEGY_LEVELS
	}
	
	var REF_STRATEGY_TIPS: DatabaseReference {
		return _REF_STRATEGY_TIPS
	}
	
	func createDBUser(uid: String, userData:Dictionary<String, Any>) {
		REF_USERS.child(uid).updateChildValues(userData)
	}

}
