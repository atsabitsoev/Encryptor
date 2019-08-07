//
//  LOPController.swift
//  Encryptor
//
//  Created by Ацамаз Бицоев on 05/08/2019.
//  Copyright © 2019 Ацамаз Бицоев. All rights reserved.
//

import Foundation


class LOPController: LOPControllerDelegate {
    
    
    required init(view: LOPViewDelegate) {
        
        self.view = view
        self.model = LOPModel(controller: self)
    }
    
    
    private var view: LOPViewDelegate!
    private var model: LOPModelDelegate!
    
    
    func viewDidLoad() {
        view.makeNavBarTranslucent()
        addObservers()
        
        view.updateData(accountList: model.getTitles())
    }
    
    func viewDidAppear() {
        view.updateData(accountList: model.getTitles())
        print(AccountListService().accountList)
    }
    
    
    private func addObservers() {
        
        NotificationCenter.default.addObserver(view,
                                               selector: #selector(view.startScrolling),
                                               name: NSNotification.Name("sliderEnded"),
                                               object: nil)
        NotificationCenter.default.addObserver(view,
                                               selector: #selector(view.stopScrolling),
                                               name: NSNotification.Name("sliderBegan"),
                                               object: nil)
    }
    
}
