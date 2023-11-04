//
//  AppDelegate.swift
//  lesson-54-Nectar
//
//  Created by JAHONGIR on 21/07/23.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as! AppDelegate

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.makeKeyAndVisible()
        
//        let vc = titleList(nibName: "titleList", bundle: nil)
//        let nav = UINavigationController(rootViewController: vc)
        
        let vc = TabbarController()
        
        window?.rootViewController = vc
        
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        print("Yakunlandi")
    }

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "YourDataModelFileName")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // ...

    // MARK: - Core Data stack

    func applicationWillTerminate(_ application: UIApplication) {
        self.saveContext()
    }

    // Save the Core Data context
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

    // MARK: - Core Data boilerplate methods (optional)

    func applicationDidEnterBackground(_ application: UIApplication) {
        self.saveContext()
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Fetch data or perform any necessary tasks when the app enters the foreground
    }

}

