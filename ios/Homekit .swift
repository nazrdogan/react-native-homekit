import  HomeKit

@objc(Homekit)
class Homekit: NSObject , HMHomeManagerDelegate {
    var homeManager = HMHomeManager()
    let accessoryBrowser = HMAccessoryBrowser();
    override init() {
      self.homeManager = HMHomeManager()
      super.init()
      self.homeManager.delegate = self
    }

    @objc static func requiresMainQueueSetup() -> Bool {
        return false
    }
    @objc(addHome:withResolver:withRejecter:)
    func addHome(name: String, resolve: @escaping(RCTPromiseResolveBlock), reject: @escaping(RCTPromiseRejectBlock)) -> Void {
        homeManager.addHome(withName: name) { newHome, error in
            if error != nil {
                reject("error", error?.localizedDescription, error);
             } else {
              resolve(name)
    
             }
        }
    }
    
    @objc(removeHome:withResolver:withRejecter:)
    func removeHome(name: String, resolve: @escaping(RCTPromiseResolveBlock), reject: @escaping(RCTPromiseRejectBlock)) -> Void {
       print(name)
       guard let home = self.findHome(name: name) else {
        reject("error","Home cannot found", nil);
        return
        }
       homeManager.removeHome(home) { error in
           if let error = error {
             reject("error", error.localizedDescription, error);
           } else {
             resolve(name)
           }
        }
    }
    func findHome(name: String) -> HMHome? {
        for home in homeManager.homes {
             print(name)
            if home.name == name {
                return home
            }
       }
        return nil
     }
}


