//
//  ShowingAccountControllerDelegate.swift
//  Encryptor
//
//  Created by Ацамаз Бицоев on 07/08/2019.
//  Copyright © 2019 Ацамаз Бицоев. All rights reserved.
//

import Foundation


protocol ShowingAccountControllerDelegate {

    
    func viewDidLoad()
    func butCopyLoginTapped(login: String)
    func butCopyPasswordTapped(password: String)
    func butEyeTapped()
    func butDeleteTapped()
}
