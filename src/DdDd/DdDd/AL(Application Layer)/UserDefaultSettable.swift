//
//  UserDefaultSettable+Extension.swift
//  DdDd
//
//  Created by fuchen on 2019/6/20.
//  Copyright © 2019 wubaolai. All rights reserved.
//

import Foundation

protocol UserDefaultNameSpace { }

extension UserDefaultNameSpace {
    static func namespace<T>(_ key:T) -> String where T :RawRepresentable {
        return "\(Self.self).\(key.rawValue) "
    }
}
protocol UserDefaultSettable: UserDefaultNameSpace {
    associatedtype UserDefaultKey : RawRepresentable
}

extension UserDefaultSettable {
    
    static func set(value:Int, forKey key:UserDefaultKey){
        let key = namespace(key)
        UserDefaults.standard.set(value, forKey: key)
    }
    
    static func integer(forKey key:UserDefaultKey) -> Int {
        let key = namespace(key)
        return UserDefaults.standard.integer(forKey: key)
    }
    
    static func set(value:Any?, forKey key:UserDefaultKey){
        let key = namespace(key)
        UserDefaults.standard.set(value, forKey: key)
    }
    
    static func string(forKey key:UserDefaultKey) -> String? {
        let key = namespace(key)
        return UserDefaults.standard.string(forKey: key)
    }
}
