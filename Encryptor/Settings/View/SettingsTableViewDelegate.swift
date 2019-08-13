//
//  SettingsTableViewDelegate.swift
//  Encryptor
//
//  Created by Ацамаз Бицоев on 13/08/2019.
//  Copyright © 2019 Ацамаз Бицоев. All rights reserved.
//

import Foundation
import UIKit


extension SettingsView: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "settingsTouchIdCell") as! SettingsTouchIdCell
            cell.switchControl.setOn(isSwitchEnabled, animated: false)
            return cell
        case 1:
            return tableView.dequeueReusableCell(withIdentifier: "settingsChangePinCell")!
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 1 {
            cellChangePinSelected()
        }
    }
    
    
}
