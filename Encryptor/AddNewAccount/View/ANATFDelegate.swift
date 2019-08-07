//
//  ANATFDelegate.swift
//  Encryptor
//
//  Created by Ацамаз Бицоев on 07/08/2019.
//  Copyright © 2019 Ацамаз Бицоев. All rights reserved.
//

import Foundation
import UIKit

extension ANAView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField.tag {
        case 0:
            tfLogin.becomeFirstResponder()
        case 1:
            tfPassword.becomeFirstResponder()
        default:
            self.view.endEditing(true)
        }
        return true
    }
}
