//
//  PINController.swift
//  Encryptor
//
//  Created by Ацамаз Бицоев on 07/08/2019.
//  Copyright © 2019 Ацамаз Бицоев. All rights reserved.
//

import Foundation


class PINController: PINControllerDelegate {
    
    
    init(view: PINViewDelegate) {
        self.view = view
        self.model = PINModel(controller: self)
    }
    
    
    private var view: PINViewDelegate!
    private var model: PINModelDelegate!
    
    
    func viewDidAppear() {
        view.enableBiometricScanner()
    }
    
    
    func rightCodeEntered() {
        view.openApp()
    }
    
    func wrongCodeEntered() {
        view.showWrongPinError()
    }
    
    func butNumberTapped(symbol: String) {
        model.newNumberAdded(string: symbol)
    }
    
    func butDeleteTapped() {
        model.deleteLastSymbol()
    }
    
    func currentCodeDidSet(value: String) {
        view.setTextToLabCode(text: value)
    }
    
}
