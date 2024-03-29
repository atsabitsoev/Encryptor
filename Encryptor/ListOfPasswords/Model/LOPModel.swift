//
//  LOPModel.swift
//  Encryptor
//
//  Created by Ацамаз Бицоев on 05/08/2019.
//  Copyright © 2019 Ацамаз Бицоев. All rights reserved.
//

import Foundation


class LOPModel: LOPModelDelegate {
    
    
    required init(controller: LOPControllerDelegate) {
        
        self.controller = controller
    }
    
    
    private var controller: LOPControllerDelegate!
    
    
    func getTitles() -> [String] {
        let accounts = AccountListService().accountList
        let titles = accounts.map { (titleLogin) -> String in
            return titleLogin[0]
        }
        return titles
    }
}
