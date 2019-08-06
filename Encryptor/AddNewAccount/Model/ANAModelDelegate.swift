//
//  ANAModelDelegate.swift
//  Encryptor
//
//  Created by Ацамаз Бицоев on 06/08/2019.
//  Copyright © 2019 Ацамаз Бицоев. All rights reserved.
//

import Foundation


protocol ANAModelDelegate {
    
    func saveAccount(title: String,
                     login: String,
                     password: String)
}
