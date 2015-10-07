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

        // not necessary here
//        registerForKeyboardNotifications(self)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        registerForKeyboardNotifications(self)
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        unregisterFromKeyboardNotifications()
    }

    func keyboardWillTransition(state: KeyboardState) {
        
    }
    
    func keyboardTransitionAnimation(state: KeyboardState) {
        switch state {
        case .Hidden:
            textFieldBottom.constant = 0
        case .ActiveWithHeight(let height):
            // view controller's view bottom pinned to other view (tabbar - see screen shot) of parent controller (UITabBarController)
            // so we should manually shift textFieldBottom to this difference
            
            let tabBarHeight = tabBarController?.tabBar.bounds.height ?? 0.0
            textFieldBottom.constant = height - tabBarHeight
        }
        view.layoutIfNeeded()
    }
    
    func keyboardDidTransition(state: KeyboardState) {
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }

}
