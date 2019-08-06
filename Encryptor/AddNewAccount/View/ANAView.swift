//
//  ANAView.swift
//  Encryptor
//
//  Created by Ацамаз Бицоев on 06/08/2019.
//  Copyright © 2019 Ацамаз Бицоев. All rights reserved.
//

import UIKit

class ANAView: UIViewController, ANAViewDelegate {
    
    
    private var controller: ANAControllerDelegate!
    
    
    @IBOutlet weak var tfTitle: UITextField!
    @IBOutlet weak var tfLogin: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var butEncrypt: EncryptionButView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        controller.viewDidLoad()
    }
    
    
    private func configureView() {
        self.controller = ANAController(view: self)
    }
    
    
    func addActionsToButEncrypt(tapAction: @escaping () -> (),
                                finishAction: @escaping () -> ()) {
        butEncrypt.actionEncrypt = tapAction
        butEncrypt.actionOnFinish = finishAction
    }
    
    func getAccount() -> [String] {
        guard let title = tfTitle.text, let login = tfLogin.text, let password = tfPassword.text else { return [] }
        return [title, login, password]
    }
    
    func stopUserInteractions() {
        self.view.isUserInteractionEnabled = false
    }
    
    func startUserInteractions() {
        self.view.isUserInteractionEnabled = true
    }
    
    func goToRootVC() {
        self.navigationController?.popToRootViewController(animated: true)
    }

}