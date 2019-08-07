//
//  PINControllerDelegate.swift
//  Encryptor
//
//  Created by Ацамаз Бицоев on 07/08/2019.
//  Copyright © 2019 Ацамаз Бицоев. All rights reserved.
//

import Foundation


protocol PINControllerDelegate {
    
    
    func rightCodeEntered()
    func wrongCodeEntered()
    func butNumberTapped(symbol: String)
    func butDeleteTapped()
    func currentCodeDidSet(value: String)
}
