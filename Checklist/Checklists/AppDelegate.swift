
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  let dataModel = DataModel()

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
    let navigationController = window!.rootViewController as! UINavigationController
    let controller = navigationController.viewControllers[0] as! AllListsViewController
    controller.dataModel = dataModel

    return true
  }

  func applicationWillResignActive(_ application: UIApplication) {
    
    
  }

  func applicationDidEnterBackground(_ application: UIApplication) {
    saveData()
  }

  func applicationWillEnterForeground(_ application: UIApplication) {
    
  }

  func applicationDidBecomeActive(_ application: UIApplication) {
    
  }

  func applicationWillTerminate(_ application: UIApplication) {
    saveData()
  }

  func saveData() {
    dataModel.saveChecklists()
  }
  
  func application(_ application: UIApplication, didReceive notification: UILocalNotification) {
    print("didReceiveLocalNotification \(notification)")
  }
}
