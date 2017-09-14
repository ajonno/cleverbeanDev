//
//  EmailValidation.swift
//  cleverbean
//
//  Created by Angus Johnston on 20/8/17.
//  Copyright © 2017 AAMSCO. All rights reserved.
//

import UIKit

class EmailTextFieldValidator {
	
	func validate(field: UITextField) -> String? {
		guard let trimmedText = field.text?.trimmingCharacters(in: .whitespacesAndNewlines) else {
			return nil
		}
		
		guard let dataDetector = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue) else {
			return nil
		}
		
		let range = NSMakeRange(0, NSString(string: trimmedText).length)
		let allMatches = dataDetector.matches(in: trimmedText,
		                                      options: [],
		                                      range: range)
		
		if allMatches.count == 1,
			allMatches.first?.url?.absoluteString.contains("mailto:") == true
		{
			return trimmedText
		}
		return nil
	}
	
}
