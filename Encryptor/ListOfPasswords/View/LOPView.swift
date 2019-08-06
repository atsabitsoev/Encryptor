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
    
    
    var accountList: [String: String]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        
        controller.viewDidLoad()
    }
    
    
    private func configureView() {
        
        controller = LOPController(view: self)
    }
    
    
    func makeNavBarTranslucent() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
    func updateData(accountList: [String: String]) {
        self.accountList = accountList
        tableView.reloadData()
    }
    
    
    @objc
    func stopScrolling() {
        tableView.isScrollEnabled = false
    }
    
    @objc
    func startScrolling() {
        tableView.isScrollEnabled = true
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }

}
