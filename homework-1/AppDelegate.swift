import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    //1.1
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("\(#function)")
        return true
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("\(#function)")
        return true
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        print("\(#function)")
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        print("\(#function)")
    }
    
    //1.2
    func applicationWillResignActive(_ application: UIApplication) {
        print("\(#function)")
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
         print("\(#function)")
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        print("\(#function)")
    }
    
    private func openSharedViewController(text: String) {
        guard let rootController = self.window?.rootViewController else {
            print("rootViewController is nil")
            return
        }
        let storyboard = UIStoryboard(name: "Shared", bundle: nil)
        let sharedViewController = storyboard.instantiateViewController(withIdentifier: "SharedViewController")
        if let controller = sharedViewController as? SharedViewController {
            controller.sharedText = text
        }
        rootController.present(sharedViewController, animated: false, completion: nil)
    }
}

extension AppDelegate {
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
        if let ud = UserDefaults(suiteName: "group.otus.share") {
            if let shareText = ud.object(forKey: "shareText") as? String {
                openSharedViewController(text: shareText)
            }
        }
        
        return true
        
    }
    
}

