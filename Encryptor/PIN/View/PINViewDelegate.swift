//
//  PINViewDelegate.swift
//  Encryptor
//
//  Created by Ацамаз Бицоев on 07/08/2019.
//  Copyright © 2019 Ацамаз Бицоев. All rights reserved.
//

import Foundation


protocol PINViewDelegate {
    
    func setTextToLabCode(text: String)
    func showWrongPinError()
    func openApp()
}
