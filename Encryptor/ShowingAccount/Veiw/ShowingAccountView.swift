//
//  ShowingAccountView.swift
//  Encryptor
//
//  Created by Ацамаз Бицоев on 07/08/2019.
//  Copyright © 2019 Ацамаз Бицоев. All rights reserved.
//

import UIKit

class ShowingAccountView: UIViewController, ShowingAccountViewDelegate {
    
    
    
    private var controller: ShowingAccountControllerDelegate!
    
    
    @IBOutlet weak var viewLogin: UIView!
    @IBOutlet weak var butLogin: UIButton!
    @IBOutlet weak var viewPassword: UIView!
    @IBOutlet weak var butPassword: UIButton!
    @IBOutlet weak var blurEffect: UIVisualEffectView!
    @IBOutlet weak var labCopied: UILabel!
    
    
    
    private var titleText: String!
    private var login: String!
    private var password: String!
    
    
    var row: Int! = 0
    var passwordIsVisible = false
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        controller.viewDidLoad()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        viewLogin.layer.cornerRadius = viewLogin.bounds.height / 2
        viewPassword.layer.cornerRadius = viewPassword.bounds.height / 2
    }
    
    
    private func configure() {
        self.controller = ShowingAccountController(view: self)
    }
    
    
    func setDefaultValues(accountData: [String: String]) {
        
        self.titleText = accountData["title"]
        self.login = accountData["login"]
        self.password = accountData["password"]
    }
    
    func setDefaultUI() {
        self.navigationItem.title = titleText
        butLogin.setTitle(login, for: .normal)
        butPassword.setTitle(passwordIsVisible ? password : makeSecret(password),
                             for: .normal)
    }
    
    
    func showSuccessAlertLogin() {
        showAlert(with: "Login copied!")
    }
    
    func showSuccessAlertPassword() {
        showAlert(with: "Password copied!")
    }
    
    private func showAlert(with message: String) {
        labCopied.text = message
        showBlurView()
        Timer.scheduledTimer(withTimeInterval: 1,
                             repeats: false) { (timer) in
                                self.hideBlurView()
        }
    }
    
    private func showBlurView() {
         self.blurEffect.isHidden = false
        UIView.animate(withDuration: 0.3) {
            self.blurEffect.alpha = 1
        }
    }
    
    private func hideBlurView() {
        
        UIView.animate(withDuration: 0.3,
                       animations: {
                        self.blurEffect.alpha = 0
        }) { (finished) in
            self.blurEffect.isHidden = true
        }
    }
    
    
    private func makeSecret(_ string: String) -> String {
        var secretString = ""
        for _ in string {
            secretString.append("*")
        }
        return secretString
    }
    
    
    func changePasswordVisibility() {
        if passwordIsVisible {
            let secretPassword = makeSecret(password)
            butPassword.setTitle(secretPassword, for: .normal)
        } else {
            butPassword.setTitle(password, for: .normal)
        }
        passwordIsVisible = !passwordIsVisible
    }
    
    
    func goToRoot() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
    @IBAction func butLoginTapped(_ sender: UIButton) {
        controller.butCopyLoginTapped(login: self.login)
    }
    
    @IBAction func butPasswordTapped(_ sender: UIButton) {
        controller.butCopyPasswordTapped(password: self.password)
    }
    
    @IBAction func butEyeTapped(_ sender: UIButton) {
        controller.butEyeTapped()
    }
    
    @IBAction func butDeleteTapped(_ sender: UIBarButtonItem) {
        controller.butDeleteTapped()
    }
}
