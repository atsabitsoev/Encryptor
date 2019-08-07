//
//  PINView.swift
//  Encryptor
//
//  Created by Ацамаз Бицоев on 07/08/2019.
//  Copyright © 2019 Ацамаз Бицоев. All rights reserved.
//

import UIKit
import AudioToolbox


class PINView: UIViewController, PINViewDelegate {
    
    
    private var controller: PINControllerDelegate!
    
    
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var labCode: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        roundButtons()
    }
    
    
    private func configureView() {
        self.controller = PINController(view: self)
    }
    
    
    private func roundButtons() {
        for i in buttons {
            i.layer.cornerRadius = i.bounds.height / 2
        }
    }
    
    
    func setTextToLabCode(text: String) {
        labCode.text = text
    }
    
    
    func showWrongPinError() {
        self.view.isUserInteractionEnabled = false
        labCode.textColor = .red
        Timer.scheduledTimer(withTimeInterval: 1,
                             repeats: false) { (_ ) in
                                self.labCode.textColor = .white
                                self.vibrate()
                                self.labCode.text = ""
                                self.view.isUserInteractionEnabled = true
        }
    }
    
    func openApp() {
        let storyboard = UIStoryboard(name: "ListOfPasswords", bundle: nil)
        let listOfPasswordsVC = storyboard.instantiateInitialViewController()!
        self.present(listOfPasswordsVC,
                     animated: true,
                     completion: nil)
    }
    
    private func vibrate() {
        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
    }
    
    
    
    
    @IBAction func butNumberTapped(_ sender: UIButton) {
        guard let symbol = sender.titleLabel?.text else { return }
        controller.butNumberTapped(symbol: symbol)
    }
    
    @IBAction func butDeleteTapped(_ sender: UIButton) {
        controller.butDeleteTapped()
    }
}
