//
//  LOPViewDelegate.swift
//  Encryptor
//
//  Created by Ацамаз Бицоев on 05/08/2019.
//  Copyright © 2019 Ацамаз Бицоев. All rights reserved.
//

import Foundation

@objc
protocol LOPViewDelegate {
    
    func updateData(accountList: [String])
    func makeNavBarTranslucent()
    @objc func stopScrolling()
    @objc func startScrolling()
    func goToShowingAccountView(row: Int) -> ()
    func goToSettingsVC()
    func goToAddNewAccountVC()
}
