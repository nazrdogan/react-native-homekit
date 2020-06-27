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
    @objc(addAccessoryToHome:toHome:withResolver:withRejecter:)
    func addAccessoryToHome(accessoryName: String, toHome: String ,resolve: @escaping(RCTPromiseResolveBlock), reject: @escaping(RCTPromiseRejectBlock)) -> Void{
        guard let home = self.findHome(name: toHome) else {
            reject("error","Home cannot found", nil);
            return
        }
        guard let accessory = self.findAccessory(name: accessoryName) else {
            reject("error","Home cannot found", nil);
            return
        }
        home.addAccessory(accessory) { (error) in
            if let error = error {
                reject("error", error.localizedDescription, error);
            } else {
                resolve(accessory)
            }
        }
        
    }
    
    @objc(removeAccessoryFromHome:fromHome:withResolver:withRejecter:)
    func removeAccessoryFromHome(accessoryName: String, fromHome: String ,resolve: @escaping(RCTPromiseResolveBlock), reject: @escaping(RCTPromiseRejectBlock)) -> Void{
        guard let home = self.findHome(name: fromHome) else {
            reject("error","Home cannot found", nil);
            return
        }
        guard let accessory = self.findAccessoryInHome(name: accessoryName, inHome: home) else {
            reject("error","Home cannot found", nil);
            return
        }
        home.removeAccessory(accessory) { (error) in
            if let error = error {
                reject("error", error.localizedDescription, error);
            } else {
                resolve(accessory)
            }
        }
    }
    
    @objc(assignAccessoryToRoom:roomName:homeName:withResolver:withRejecter:)
    func assignAccessoryToRoom(accessoryName: String, roomName: String , homeName: String , resolve: @escaping(RCTPromiseResolveBlock), reject: @escaping(RCTPromiseRejectBlock)) -> Void{
        guard let home = self.findHome(name: homeName) else {
            reject("error","Home cannot found", nil);
            return
        }
        guard let accessory = self.findAccessoryInHome(name: accessoryName, inHome: home) else {
            reject("error","Home cannot found", nil);
            return
        }
        guard let room = self.findRoom(name: accessoryName, inHome: home) else {
            reject("error","Home cannot found", nil);
            return
        }
        home.assignAccessory(accessory , to: room) { (error) in
            if let error = error {
                reject("error", error.localizedDescription, error);
            } else {
                resolve(accessory)
            }
        }
    }
    
    @objc(renameAccessory:newName:withResolver:withRejecter:)
    func renameAccessory(oldName: String, newName: String ,resolve: @escaping(RCTPromiseResolveBlock), reject: @escaping(RCTPromiseRejectBlock)) -> Void{
        guard let accessory = self.findAccessory(name: oldName) else {
                   reject("error","Home cannot found", nil);
                   return
            }
      accessory.updateName(newName) { (error) in
          if let error = error {
              reject("error", error.localizedDescription, error);
          } else {
              resolve(accessory)
          }
      }
    }
    
    //Helper functions
    private func findHome(name: String) -> HMHome? {
        for home in homeManager.homes {
            if home.name == name {
                return home
            }
        }
        return nil
    }
    private func findRoom(name: String, inHome: HMHome) -> HMRoom? {
        for room in inHome.rooms {
            if room.name == name {
                return room
            }
        }
        return nil
    }
    
    private func findAccessory(name: String) -> HMAccessory? {
        for accessory in accessoryBrowser.discoveredAccessories {
            if accessory.name == name {
                return accessory
            }
        }
        return nil
    }
    
    private func findAccessoryInHome(name: String, inHome: HMHome) ->  HMAccessory? {
        for accessory in inHome.accessories {
            if accessory.name == name {
                return accessory
            }
        }
        return nil
    }
    
    private func findZone(name: String, home:HMHome) -> HMZone? {
        for zone in home.zones {
            if zone.name == name {
                return zone
            }
        }
        return nil
    }
}


