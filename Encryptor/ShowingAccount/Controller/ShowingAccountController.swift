//
//  ShowingAccountController.swift
//  Encryptor
//
//  Created by Ацамаз Бицоев on 07/08/2019.
//  Copyright © 2019 Ацамаз Бицоев. All rights reserved.
//

import Foundation


class ShowingAccountController: ShowingAccountControllerDelegate {
    
    
    
    init(view: ShowingAccountViewDelegate) {
        self.view = view
        self.model = ShowingAccountModel(controller: self)
    }
    
    
    private var view: ShowingAccountViewDelegate!
    private var model: ShowingAccountModelDelegate!
    
    
    func viewDidLoad() {
        
        model.row = view.row
        let accountData = model.getAccountData()
        view.setDefaultValues(accountData: accountData)
        view.setDefaultUI()
    }
    
    
    func butCopyLoginTapped(login: String) {
        model.copyText(text: login)
        view.showSuccessAlertLogin()
    }
    
    func butCopyPasswordTapped(password: String) {
        model.copyText(text: password)
        view.showSuccessAlertPassword()
    }
    
    func butEyeTapped() {
        view.changePasswordVisibility()
    }
    
    func butDeleteTapped() {
        model.deleteAccountData()
        view.goToRoot()
    }
}
