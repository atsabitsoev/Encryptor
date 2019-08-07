//
//  KeychainService.swift
//  Encryptor
//
//  Created by Ацамаз Бицоев on 05/08/2019.
//  Copyright © 2019 Ацамаз Бицоев. All rights reserved.
//

import Foundation
import KeychainSwift


class KeychainService {
    
    
    static func save(login: String, password: String) {
        KeychainSwift().set(password, forKey: login)
    }
    
    static func password(for login: String) -> String {
        return KeychainSwift().get(login) ?? ""
    }
    
    static func delete(login: String) {
        KeychainSwift().delete(login)
    }
}
