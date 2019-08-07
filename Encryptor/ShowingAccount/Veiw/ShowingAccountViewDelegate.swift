//
//  ShowingAccountViewDelegate.swift
//  Encryptor
//
//  Created by Ацамаз Бицоев on 07/08/2019.
//  Copyright © 2019 Ацамаз Бицоев. All rights reserved.
//

import Foundation


protocol ShowingAccountViewDelegate {
    
    var row: Int! { get set }
    
    func setDefaultValues(accountData: [String: String])
    func setDefaultUI()
    func showSuccessAlertLogin()
    func showSuccessAlertPassword()
    func goToRoot()
}
