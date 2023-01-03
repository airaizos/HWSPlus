import Cocoa

/**
 **3.Ene.2023**
##Foundation##
[Storing preferences efficiently](https://www.hackingwithswift.com/plus/making-the-most-of-foundation/storing-preferences-efficiently)
**/

//riesgo de que se meta otro hilo y haga líos
func loadSettings() {
    let defaults = UserDefaults.standard
    
    if defaults.bool(forKey: "SettingsSaved") == false {
        defaults.set(true, forKey: "SettingsSaved")
        defaults.set("standard", forKey: "ReadingMode")
        defaults.set(0, forKey: "HighScore")
    }
}
    // no hará overrideValues, se vuelve más flexible,
    func betterLoadSettings() {
        UserDefaults.standard.register(defaults: [
            "ReadingMode": "standard",
            "HighScore": 0])
    }
    //Appgroups. errores tipograficos, tenerlo por todos lados
    
   // func syncLoadSettings() {
     //   guard let defaults = UserDefaults(suiteName: "group.com.CuatroAguacates.hackingwiths") else { return }
 //   }
    
    func loadSettings2() {
        UserDefaults.shared.register(defaults: [
            "ReadingMode": "standard",
            "HighScore": 0])
    }



extension UserDefaults {
    static var shared: UserDefaults {
        guard let defaults = UserDefaults(suiteName: "group.com.CuatroAguacates.hackingwiths") else {
            return UserDefaults.standard //fatalError("Missing app group")
            
        }
        return defaults
    }
    
    //iCloud in capabilities
    
    func iCloudLoadSettings() {
        //sincronizar iclod y userdefaults
        
    }
    
    
}
//esta clase se puede añadir a la func application en app delegate
final class CloudDefaults {
    static let shared = CloudDefaults()
    private var ignoreLocalChanges = false
    
    private init() { }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func start() {
        NotificationCenter.default.addObserver(forName: NSUbiquitousKeyValueStore.didChangeExternallyNotification, object: NSUbiquitousKeyValueStore.default, queue: .main, using: updateLocal)
        
        //se triguerea cuando modificamos userdefaults
        NotificationCenter.default.addObserver(forName: UserDefaults.didChangeNotification, object: nil, queue: .main, using: updateRemote)
    }
    
    private func updateRemote(note: Notification) {
        guard ignoreLocalChanges == false else { return }
        
        for (key, value) in UserDefaults.standard.dictionaryRepresentation() {
            //prefijo personalizado
            guard key.hasPrefix("sync-") else { continue }
            print("Updating remote value of\(key) to \(value)")
            NSUbiquitousKeyValueStore.default.set(value, forKey: key)
        }
    }
    
    private func updateLocal(note: Notification) {
        ignoreLocalChanges = true
        
        for (key, value) in NSUbiquitousKeyValueStore.default.dictionaryRepresentation {
            guard key.hasPrefix("sync-") else { continue }
            print("Updating remote value of\(key) to \(value)")
            UserDefaults.standard.set(value, forKey: key)
        }
        
        ignoreLocalChanges = false
    }
    
}
