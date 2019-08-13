//
//  SettingsView.swift
//  Encryptor
//
//  Created by Ацамаз Бицоев on 13/08/2019.
//  Copyright © 2019 Ацамаз Бицоев. All rights reserved.
//

import UIKit

class SettingsView: UIViewController {
    
    
    private var controller: SettingsController!
    
    
    var isSwitchEnabled: Bool!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        controller.viewDidLoad()
    }
    
    
    private func configureView() {
        self.controller = SettingsController(view: self)
    }
    
    
    func setTouchSwithState(_ enabled: Bool) {
        isSwitchEnabled = enabled
        tableView.reloadData()
    }
    
    
    func showNewPinAlert() {
        let alert = UIAlertController(title: "New PIN", message: "Enter new PIN", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addTextField { (textfield) in
            textfield.keyboardType = .numberPad
        }
        let okAction = UIAlertAction(title: "Save", style: .default) { (action) in
            self.controller.okChangePinTapped(with: alert.textFields!.first!.text!)
        }
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }

    
    func cellChangePinSelected() {
        controller.cellChangePinSelected()
    }
    
    @IBAction func touchIdChanged(_ sender: UISwitch) {
        controller.touchIdChanged(to: sender.isOn)
    }
}
