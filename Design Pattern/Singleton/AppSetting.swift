//
//  AppSetting.swift
//  Design Pattern
//
//  Created by Uday on 19/08/21.
//

import Foundation

final public class AppSetting{
    
    /// created singalton object
    public static let shared = AppSetting()
    
    /// queue for thread saftey
    private let serialQueue = DispatchQueue(label: "serial")
    
    private init() {}
    
    ///settings values
    private var settings: [String: Any] = ["theme":"Dark",
                                           "userLimit": 30]
    
    ///get data from settings
    public func string(forKey key: String) -> String?{
        var result: String?
        serialQueue.sync {
            result = settings[key] as? String
        }
        return result
    }
    
    ///get data from settings
    public func int(forKey key:String) -> Int?{
        var result: Int?
        serialQueue.sync {
            result = settings[key] as? Int
        }
        return result
    }
    
    ///set data for settings
    public func set(value: Any, forKey key: String){
        serialQueue.sync {
            settings[key] = value
        }
    }
    
}



final public class AppSettingReadLock{
    
    /// created singalton object
    public static let shared = AppSettingReadLock()
    
    /// concurrent queue for thread saftey
    private let concurrentQueue = DispatchQueue(label: "concurrent", attributes: .concurrent)
    
    private init() {}
    
    ///settings values
    private var settings: [String: Any] = ["theme":"Dark",
                                           "userLimit": 30]
    
    ///get data from settings
    public func string(forKey key: String) -> String?{
        var result: String?
        concurrentQueue.sync {
            result = settings[key] as? String
        }
        return result
    }
    
    ///get data from settings
    public func int(forKey key:String) -> Int?{
        var result: Int?
        concurrentQueue.sync {
            result = settings[key] as? Int
        }
        return result
    }
    
    ///set data for settings
    public func set(value: Any, forKey key: String){
        ///used barrier which convert concurrent queue into serial queue
        concurrentQueue.async(flags: .barrier){
            self.settings[key] = value
        }
    }    
}
