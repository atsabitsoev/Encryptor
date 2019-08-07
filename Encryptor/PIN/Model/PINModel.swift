//
//  PINModel.swift
//  Encryptor
//
//  Created by Ацамаз Бицоев on 07/08/2019.
//  Copyright © 2019 Ацамаз Бицоев. All rights reserved.
//

import Foundation


class PINModel: PINModelDelegate {
    
    
    init(controller: PINControllerDelegate) {
        self.controller = controller
    }
    
    
    private var controller: PINControllerDelegate!
    
    
    private var currentCode = ""
    private let rightCode = "11111" //UserDefaults.standard.string(forKey: "pin") ?? ""
    
    
    func newNumberAdded(string: String) {
        currentCode.append(string)
        controller.currentCodeDidSet(value: currentCode)
        if currentCode.count == rightCode.count {
            if currentCode == rightCode{
                controller.rightCodeEntered()
            } else {
                controller.wrongCodeEntered()
                clearCode()
            } 
        }
    }
    
    func deleteLastSymbol() {
        currentCode = String(currentCode.dropLast())
        controller.currentCodeDidSet(value: currentCode)
    }
    
    private func clearCode() {
        currentCode = ""
    }
    
    
}
