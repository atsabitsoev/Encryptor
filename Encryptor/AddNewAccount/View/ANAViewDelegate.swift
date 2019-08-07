//
//  ANAViewDelegate.swift
//  Encryptor
//
//  Created by Ацамаз Бицоев on 06/08/2019.
//  Copyright © 2019 Ацамаз Бицоев. All rights reserved.
//

import Foundation


protocol ANAViewDelegate {
    
    func setTextFields()
    func addActionsToButEncrypt(tapAction: @escaping () -> (),
                                finishAction: @escaping () -> ())
    func getAccount() -> [String]
    func addRecognizer()
    func goToRootVC()
    func stopUserInteractions()
    func startUserInteractions()
}
