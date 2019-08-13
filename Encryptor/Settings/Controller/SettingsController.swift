//
//  SettingsController.swift
//  Encryptor
//
//  Created by Ацамаз Бицоев on 13/08/2019.
//  Copyright © 2019 Ацамаз Бицоев. All rights reserved.
//

import Foundation


class SettingsController {
    
    
    var view: SettingsView!
    var model: SettingsModel!
    
    
    required init(view: SettingsView) {
        self.view = view
        self.model = SettingsModel(controller: self)
    }
    
    
    func viewDidLoad() {
        view.setTouchSwithState(model.isTouchIdEnabled)
    }
    
    
    func touchIdChanged(to value: Bool) {
        model.enableTouchId(value)
    }
    
    func cellChangePinSelected() {
        view.showNewPinAlert()
    }
    
    func okChangePinTapped(with pin: String) {
        model.changePin(to: pin)
    }
    
}
