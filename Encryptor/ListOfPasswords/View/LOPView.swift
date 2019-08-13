//
//  LOPView.swift
//  Encryptor
//
//  Created by Ацамаз Бицоев on 05/08/2019.
//  Copyright © 2019 Ацамаз Бицоев. All rights reserved.
//

import UIKit

class LOPView: UIViewController, LOPViewDelegate {
    
    
    
    
    private var controller: LOPControllerDelegate!
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var labHolder: UILabel!
    
    
    var masTitles: [String] = [] {
        didSet {
            if masTitles.count == 0 {
                labHolder.isHidden = false
            } else {
                labHolder.isHidden = true
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        
        controller.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        controller.viewDidAppear()
    }
    
    
    private func configureView() {
        
        controller = LOPController(view: self)
    }
    
    
    func makeNavBarTranslucent() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
    func updateData(accountList: [String]) {
        self.masTitles = accountList
        tableView.reloadData()
    }
    
    
    func goToShowingAccountView(row: Int) {
        let storyboard = UIStoryboard(name: "ShowingAccount", bundle: nil)
        let showingAccountView = storyboard.instantiateViewController(withIdentifier: "ShowingAccountView") as! ShowingAccountView
        showingAccountView.row = row
        self.navigationController?.show(showingAccountView, sender: nil)
    }
    
    
    @objc
    func stopScrolling() {
        tableView.isScrollEnabled = false
    }
    
    @objc
    func startScrolling() {
        tableView.isScrollEnabled = true
    }
    
    
    func goToAddNewAccountVC() {
        let storyboard = UIStoryboard(name: "CreationAccount", bundle: nil)
        let creationAccountVC = storyboard.instantiateInitialViewController()
        self.navigationController?.show(creationAccountVC!, sender: nil)
    }
    
    func goToSettingsVC() {
        let storyboard = UIStoryboard(name: "Settings", bundle: nil)
        let settingsVC = storyboard.instantiateViewController(withIdentifier: "SettingsVC")
        self.navigationController?.show(settingsVC, sender: nil)
    }
    
    
    @IBAction func butAddTapped(_ sender: UIBarButtonItem) {
        controller.butAddTapped()
    }
    
    @IBAction func butSettingsTapped(_ sender: UIBarButtonItem) {
        controller.butSettingsTapped()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }

}
