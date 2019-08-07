//
//  PINModelDelegate.swift
//  Encryptor
//
//  Created by Ацамаз Бицоев on 07/08/2019.
//  Copyright © 2019 Ацамаз Бицоев. All rights reserved.
//

import Foundation


protocol PINModelDelegate {
    
    
    func newNumberAdded(string: String)
    func deleteLastSymbol()
}
