//
//  ViewController.swift
//  Keyboardy PR1
//
//  Created by Duc iOS on 10/7/15.
//  Copyright © 2015 Duc iOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController, KeyboardStateDelegate {

    @IBOutlet weak var textFieldBottom: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()

        registerForKeyboardNotifications(self)
    }
    
    override func viewWillAppear(animated: Bool) {
        registerForKeyboardNotifications(self)
    }
    
    override func viewDidDisappear(animated: Bool) {
        unregisterFromKeyboardNotifications()
    }

    func keyboardWillTransition(state: KeyboardState) {
        
    }
    
    func keyboardTransitionAnimation(state: KeyboardState) {
        switch state {
        case .Hidden:
            textFieldBottom.constant = 0
        case .ActiveWithHeight(let height):
            textFieldBottom.constant = height
        }
        view.layoutIfNeeded()
    }
    
    func keyboardDidTransition(state: KeyboardState) {
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }

}
