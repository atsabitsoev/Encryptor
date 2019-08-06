//
//  ANAController.swift
//  Encryptor
//
//  Created by Ацамаз Бицоев on 06/08/2019.
//  Copyright © 2019 Ацамаз Бицоев. All rights reserved.
//

import Foundation


class ANAController: ANAControllerDelegate {
    
    
    required init(view: ANAViewDelegate) {
        self.view = view
        self.model = ANAModel(controller: self)
    }
    
    
    func viewDidLoad() {
        view.addActionsToButEncrypt(tapAction: tapAction,
                                    finishAction: finishAction)
    }
    
    
    private func tapAction() {
        view.stopUserInteractions()
        let account = view.getAccount()
        model.saveAccount(title: account[0], login: account[1], password: account[2])
    }
    
    private func finishAction() {
        view.startUserInteractions()
        view.goToRootVC()
    }
    
    
    private var view: ANAViewDelegate!
    private var model: ANAModelDelegate!
}
