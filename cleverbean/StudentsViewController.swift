//
//  StudentsViewController.swift
//  cleverbean
//
//  Created by Angus Johnston on 9/9/17.
//  Copyright © 2017 AAMSCO. All rights reserved.
//

import UIKit

class StudentsViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!
	
	var items = [[String: String]]()

    override func viewDidLoad() {
        super.viewDidLoad()
		
		self.items = loadPlist()

		tableView.layer.cornerRadius = 4
		//makes it look like / hides empty rows in the uitableview
		tableView.backgroundColor = UIColor.clear
		tableView.separatorColor = UIColor.clear

		//removes padding at the top of the tableview
		self.edgesForExtendedLayout = UIRectEdge.init(rawValue: 0)
		
		//TODO: move this out
		self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)

		
    }
	
	func loadPlist() -> [[String: String]] {
		let path = Bundle.main.path(forResource: "sample_students_data", ofType: "plist")
		
		return NSArray.init(contentsOf: URL.init(fileURLWithPath: path!)) as! [[String: String]]
	}


}

extension StudentsViewController: UITableViewDelegate, UITableViewDataSource {
	
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		//self.selectedIndex = indexPath
		print("selected row \(indexPath)")
		
		//performSegue(withIdentifier: "groupDetail", sender: self)
	}
	
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.items.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
		
		let item = self.items[indexPath.row]
		cell.textLabel?.text = item["name"]

		return cell
	}
	
}
