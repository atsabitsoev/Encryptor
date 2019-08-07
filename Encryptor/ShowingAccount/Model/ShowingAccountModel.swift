//
//  ShowingAccountModel.swift
//  Encryptor
//
//  Created by Ацамаз Бицоев on 07/08/2019.
//  Copyright © 2019 Ацамаз Бицоев. All rights reserved.
//

import Foundation
import UIKit


class ShowingAccountModel: ShowingAccountModelDelegate {
    
    
    init(controller: ShowingAccountControllerDelegate) {
        self.controller = controller
    }
    
    
    private var controller: ShowingAccountControllerDelegate
    
    
    var row: Int!
    
    
    func getAccountData() -> [String: String] {
        
        let account = AccountListService().accountList[row]
        let title = account[0]
        let login = account[1]
        let password = KeychainService.password(for: login)
        
        return ["title": title, "login": login, "password": password]
    }
    
    func deleteAccountData() {
        let login = AccountListService().accountList[row][1]
        KeychainService.delete(login: login)
        AccountListService().accountList.remove(at: row)
    }
    
    
    func copyText(text: String) {
        UIPasteboard.general.string = text
    }
}
