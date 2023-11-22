//
//  KeyboardViewController.swift
//  DataSharingKeyboard
//
//  Created by MaxMobile Software on 22/11/2023.
//

import UIKit
import KeyboardKit

class KeyboardViewController: KeyboardInputViewController {

    override func viewDidLoad() {

        
        services.styleProvider = CustomStyleProvider(keyboardContext: state.keyboardContext)
        
        super.viewDidLoad()
    }
    
    override func viewWillSetupKeyboard() {
        super.viewWillSetupKeyboard()

        /// 💡 Make the demo use a standard ``SystemKeyboard``.
        ///
        /// This is not needed if you want to use a standard
        /// view, but this is how you can setup a custom one.
        setup { controller in
            SystemKeyboard(
                state: controller.state,
                services: controller.services,
                buttonContent: { $0.view },
                buttonView: { $0.view },
                emojiKeyboard: { $0.view },
                toolbar: { $0.view }
            )
        }
    }

}
