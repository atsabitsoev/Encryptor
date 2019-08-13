//
//  SettingsModel.swift
//  Encryptor
//
//  Created by Ацамаз Бицоев on 13/08/2019.
//  Copyright © 2019 Ацамаз Бицоев. All rights reserved.
//

import Foundation


class SettingsModel {
    
    
    var controller: SettingsController!
    
    
    required init(controller: SettingsController) {
        self.controller = controller
    }
    
    
    var isTouchIdEnabled = UserDefaults.standard.bool(forKey: "isTouchFaceIdEnabled")
    
    
    func enableTouchId(_ enable: Bool) {
        UserDefaults.standard.set(enable, forKey: "isTouchFaceIdEnabled")
    }
    
    func changePin(to pin: String) {
        UserDefaults.standard.set(pin, forKey: "pin")
    }
    
    
}
