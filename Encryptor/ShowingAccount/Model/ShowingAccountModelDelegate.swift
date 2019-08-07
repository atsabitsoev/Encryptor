//
//  ShowingAccountModelDelegate.swift
//  Encryptor
//
//  Created by Ацамаз Бицоев on 07/08/2019.
//  Copyright © 2019 Ацамаз Бицоев. All rights reserved.
//

import Foundation

protocol ShowingAccountModelDelegate {
    
    
    var row: Int! { get set }
    
    func getAccountData() -> [String: String] //["login": "lksdfj", "password": "fsdfsdsdf", "title": "sfdsdfsdf"]
    func deleteAccountData()
    func copyText(text: String)
}
