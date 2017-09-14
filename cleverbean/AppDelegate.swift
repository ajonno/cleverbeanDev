//
//  AppDelegate.swift
//  cleverbean
//
//  Created by Angus Johnston on 18/8/17.
//  Copyright © 2017 AAMSCO. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
import FacebookLogin
import FacebookCore

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {

	var window: UIWindow?


	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

		UILabel.appearance().substituteFontName = "Montserrat"
		
		UITextView.appearance().substituteFontName = "Montserrat"
		
		UITextField.appearance().substituteFontName = "Montserrat"
		
		UIButton.appearance().titleLabel?.substituteFontName = "Montserrat"

		let attrsNormal = [ //4FC2EC
			NSForegroundColorAttributeName: UIColor(red: 0x4F, green: 0xC2, blue: 0xEC) //UIColor.blue
		]
		let attrsSelected = [
			NSForegroundColorAttributeName: UIColor.white,
		]
		UITabBarItem.appearance().setTitleTextAttributes(attrsNormal, for: .normal)
		UITabBarItem.appearance().setTitleTextAttributes(attrsSelected, for: .selected)
		
		let selectedBG = UIImage(named:"tab-item-rectangle")?.resizableImage(withCapInsets: UIEdgeInsetsMake(0, 0, 0, 0))
		UITabBar.appearance().selectionIndicatorImage = selectedBG
		
		UINavigationBar.appearance().backIndicatorImage = #imageLiteral(resourceName: "arrow_left")
		UINavigationBar.appearance().backIndicatorTransitionMaskImage = #imageLiteral(resourceName: "arrow_left")
		
		FirebaseApp.configure()
		Database.database().isPersistenceEnabled = true

		//this is assuming that the login flow VC's are entirely separate from the
		//"entry point" VC. if there isn't a current user then show the auth screens
		//if there IS a current user, then just go to the "entry point" VC which would
		//be tab view controller
		if Auth.auth().currentUser == nil {
			let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
			let authVC = storyboard.instantiateViewController(withIdentifier: "start")
			window?.makeKeyAndVisible()
			window?.rootViewController?.present(authVC, animated: true, completion: nil)
		}
		
		//google login
		GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
		GIDSignIn.sharedInstance().delegate = self
		
		SDKApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
		
		return true
	}
	
	
	@available(iOS 9.0, *)
	func application(_ application: UIApplication, open url: URL, options:[UIApplicationOpenURLOptionsKey : Any]) -> Bool {
		
		return GIDSignIn.sharedInstance().handle(url,
			sourceApplication:options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String,annotation: [:]) ||
		
		SDKApplicationDelegate.shared.application(application, open: url, options: options)
		
	}


	func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
		
		if let error = error {
			print("error google signin", error)
			return
		}
	
		guard let authentication = user.authentication else { return }
		let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
	                                               accessToken: authentication.accessToken)
		print("credential is", credential)
		
		Auth.auth().signIn(with: credential) { (user, error) in
			if let error = error {
				print("google signin with credential error", error)
				return
			}
			// User is signed in
			print("SIGNED IN TO FIREBASE WITH GOOGLE", user!)
		}
	}
	

	func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!){
	}

	
	func applicationWillResignActive(_ application: UIApplication) {
		// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
		// Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
	}

	func applicationDidEnterBackground(_ application: UIApplication) {
		// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
		// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
	}

	func applicationWillEnterForeground(_ application: UIApplication) {
		// Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
	}

	func applicationDidBecomeActive(_ application: UIApplication) {
		// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
	}

	func applicationWillTerminate(_ application: UIApplication) {
		// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
	}


}

