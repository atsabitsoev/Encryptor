//
//  AccountsListService.swift
//  Encryptor
//
//  Created by Ацамаз Бицоев on 05/08/2019.
//  Copyright © 2019 Ацамаз Бицоев. All rights reserved.
//

import Foundation


class AccountListService {
    
    
    private init() {}
    static let standard = AccountListService()
    
    
    var accountList: [String: String] {
        get {
            return (UserDefaults.standard.object(forKey: "accountList") as? [String : String]) ?? [:]
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "accountList")
        }
    }
}
