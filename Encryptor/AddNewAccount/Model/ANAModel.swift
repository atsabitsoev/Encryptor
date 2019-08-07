//
//  ANAModel.swift
//  Encryptor
//
//  Created by Ацамаз Бицоев on 06/08/2019.
//  Copyright © 2019 Ацамаз Бицоев. All rights reserved.
//

import Foundation


class ANAModel: ANAModelDelegate {
    
    
    required init(controller: ANAControllerDelegate) {
        self.controller = controller
    }
    
    
    func saveAccount(title: String,
                     login: String,
                     password: String) {
        
        saveTitleLogin(title: title, login: login)
        savePassword(login: login, password: password)
    }
    
    
    private func saveTitleLogin(title: String, login: String) {
        var list = AccountListService().accountList
        list.append([title, login])
        AccountListService().accountList = list
    }
    
    private func savePassword(login: String, password: String) {
        KeychainService.save(login: login, password: password)
    }
    
    
    private var controller: ANAControllerDelegate!
}
