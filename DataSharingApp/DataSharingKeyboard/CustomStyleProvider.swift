//
//  CustomStyleProvider.swift
//  DataSharingKeyboard
//
//  Created by MaxMobile Software on 22/11/2023.
//

import Foundation
import KeyboardKit

class CustomStyleProvider: StandardKeyboardStyleProvider {
    
    let sharedDefault = UserDefaults(suiteName: "group.TestLocalPackage")!
    
    override func buttonStyle(
        for action: KeyboardAction,
        isPressed: Bool
    ) -> KeyboardStyle.Button {
        var style = super.buttonStyle(for: action, isPressed: isPressed)
        
        do {
            let model = try self.sharedDefault.getObject(forKey: "model.data", castTo: DataModel.self)
            
            print(model)
            
            style.cornerRadius = model.cornerRadius
            style.background = .color(model.backgroundColor)
            style.borderSize = model.boderSize
            style.borderColor = model.borderColor
        } catch {
            print(error.localizedDescription)
        }
        
//        style.cornerRadius = 15
//        style.backgroundColor = .clear
//        style.borderSize = 2
//        style.borderColor = .yellow
        
//        style.background = .color(.blue)
        
        return style
    }
    
}
