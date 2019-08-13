//
//  SettingsTouchIdCell.swift
//  Encryptor
//
//  Created by Ацамаз Бицоев on 13/08/2019.
//  Copyright © 2019 Ацамаз Бицоев. All rights reserved.
//

import UIKit

class SettingsTouchIdCell: UITableViewCell {

    
    @IBOutlet weak var switchControl: UISwitch!
    @IBOutlet weak var labTitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
