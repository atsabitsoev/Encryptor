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
    var masTitles: [String] = []
    
    
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
    
    
    private func setNewLists() {
        
        for i in accountList {
            masTitles.append(i.key)
        }
    }
    
    
    func makeNavBarTranslucent() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
    func updateData(accountList: [String: String]) {
        self.accountList = accountList
        masTitles = []
        setNewLists()
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
    
    
    @IBAction func butAddTapped(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "CreationAccount", bundle: nil)
        let creationAccountVC = storyboard.instantiateInitialViewController()
        self.navigationController?.show(creationAccountVC!, sender: nil)
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }

}
