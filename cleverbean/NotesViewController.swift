//
//  NotesViewController.swift
//  cleverbean
//
//  Created by Angus Johnston on 11/9/17.
//  Copyright © 2017 AAMSCO. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class NotesViewController: UIViewController, IndicatorInfoProvider {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

	func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
		return IndicatorInfo(title: "Notes")
	}

}
