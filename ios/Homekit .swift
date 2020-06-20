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
    @objc(renameHome:oldName:withResolver:withRejecter:)
       func renameHome(newName: String, oldName: String, resolve: @escaping(RCTPromiseResolveBlock), reject: @escaping(RCTPromiseRejectBlock)) -> Void {
          guard let home = self.findHome(name: oldName) else {
           reject("error","Home cannot found", nil);
           return
           }
        home.updateName(newName) { (error) in
            if let error = error {
            reject("error", error.localizedDescription, error);
            } else {
            resolve(newName)
           }
        }
    }
    
    @objc(addZone:toHome:withResolver:withRejecter:)
    func addZone(name: String, toHome:String, resolve: @escaping(RCTPromiseResolveBlock), reject: @escaping(RCTPromiseRejectBlock)) -> Void {
          guard let home = self.findHome(name: toHome) else {
                    reject("error","Home cannot found", nil);
                    return
                    }
        home.addZone(withName: name) { [weak self] zone, error in
                   if let zone = zone {
                      resolve(name)
                   }
                   if let error = error {
                    reject("error",error.localizedDescription, nil);
                   }
            }
    }
    @objc(removeZone:fromHome:withResolver:withRejecter:)
    func removeZone(name: String, fromHome:String, resolve: @escaping(RCTPromiseResolveBlock), reject: @escaping(RCTPromiseRejectBlock)) -> Void {
        guard let home = self.findHome(name: fromHome) else {
                           reject("error","Home cannot found", nil);
                           return
                           }
          guard let zone = self.findZone(name: name, home: home) else {
                    reject("error","Home cannot found", nil);
                    return
                    }
                 home.removeZone(zone) { (error) in
                     if let error = error {
                     reject("error", error.localizedDescription, error);
                     } else {
                    resolve(name)
                }
            }
    }
    @objc(renameZone:oldName:inHome:withResolver:withRejecter:)
       func renameZone(name: String, oldName:String, inHome:String, resolve: @escaping(RCTPromiseResolveBlock), reject: @escaping(RCTPromiseRejectBlock)) -> Void {
             guard let home = self.findHome(name: oldName) else {
                       reject("error","Home cannot found", nil);
                       return
                       }
        guard let zone = self.findZone(name: oldName, home: home) else {
                             reject("error","Zone cannot found", nil);
                             return
                   }
                    zone.updateName(name) { (error) in
                        if let error = error {
                        reject("error", error.localizedDescription, error);
                        } else {
                       resolve(name)
                   }
               }
       }
    
     //Helper functions
    func findHome(name: String) -> HMHome? {
        for home in homeManager.homes {
            if home.name == name {
                return home
            }
       }
        return nil
     }
    
    func findZone(name: String, home:HMHome) -> HMZone? {
           for zone in home.zones {
               if zone.name == name {
                   return zone
               }
          }
           return nil
        }
}


