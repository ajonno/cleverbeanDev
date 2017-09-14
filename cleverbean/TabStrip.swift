//
//  TabStrip.swift
//  cleverbean
//
//  Created by Angus Johnston on 11/9/17.
//  Copyright © 2017 AAMSCO. All rights reserved.
//

import Foundation
import XLPagerTabStrip

class TabStrip: ButtonBarPagerTabStripViewController {
	
	var isReload = false
	let purpleInspireColor = UIColor(red:0.13, green:0.03, blue:0.25, alpha:1.0)
	
	override func viewDidLoad() {
		
		// change selected bar color
		settings.style.buttonBarBackgroundColor = .white
		settings.style.buttonBarItemBackgroundColor = .white
		settings.style.selectedBarBackgroundColor = purpleInspireColor
		settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 14)
		settings.style.selectedBarHeight = 2.0
		settings.style.buttonBarMinimumLineSpacing = 0
		settings.style.buttonBarItemTitleColor = .black
		settings.style.buttonBarItemsShouldFillAvailiableWidth = true
		settings.style.buttonBarLeftContentInset = 0
		settings.style.buttonBarRightContentInset = 0
		
		changeCurrentIndexProgressive = { [weak self] (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
			guard changeCurrentIndex == true else { return }
			oldCell?.label.textColor = .black
			newCell?.label.textColor = self?.purpleInspireColor
		}
		
		super.viewDidLoad()

		buttonBarView.selectedBar.backgroundColor = .orange
		buttonBarView.backgroundColor = UIColor(red: 7/255, green: 185/255, blue: 155/255, alpha: 1)
	}
	
	// MARK: - PagerTabStripDataSource
	override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
		let strategies = UIStoryboard(name: "Students", bundle: nil).instantiateViewController(withIdentifier: "strategies")
		let notes = UIStoryboard(name: "Students", bundle: nil).instantiateViewController(withIdentifier: "notes")
		
		return [strategies, notes]
	}
	

}
