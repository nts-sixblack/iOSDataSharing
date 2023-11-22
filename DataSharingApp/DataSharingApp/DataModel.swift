//
//  DataModel.swift
//  DataSharingApp
//
//  Created by MaxMobile Software on 22/11/2023.
//

import Foundation
import SwiftUI

struct DataModel: Codable {
    var backgroundColor: Color
    var cornerRadius: CGFloat
    var boderSize: CGFloat
    var borderColor: Color
    
    init(backgroundColor: Color, cornerRadius: CGFloat, boderSize: CGFloat, borderColor: Color) {
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
        self.boderSize = boderSize
        self.borderColor = borderColor
    }
    
    enum CodingKeys: String, CodingKey {
        case backgroundColor
        case cornerRadius
        case boderSize
        case borderColor
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // Decode backgroundColor as a UIColor
        let backgroundColorData = try container.decode(Data.self, forKey: .backgroundColor)
        if let uiColor = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(backgroundColorData) as? UIColor {
            self.backgroundColor = Color(uiColor)
        } else {
            throw DecodingError.dataCorruptedError(forKey: .backgroundColor, in: container, debugDescription: "Failed to decode backgroundColor")
        }
        
        // Decode cornerRadius and boderSize as CGFloat
        self.cornerRadius = try container.decode(CGFloat.self, forKey: .cornerRadius)
        self.boderSize = try container.decode(CGFloat.self, forKey: .boderSize)
        
        // Decode borderColor as a UIColor
        let borderColorData = try container.decode(Data.self, forKey: .borderColor)
        if let uiColor = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(borderColorData) as? UIColor {
            self.borderColor = Color(uiColor)
        } else {
            throw DecodingError.dataCorruptedError(forKey: .borderColor, in: container, debugDescription: "Failed to decode borderColor")
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        // Encode backgroundColor as a UIColor
        let uiColor = UIColor(self.backgroundColor)
        let backgroundColorData = try NSKeyedArchiver.archivedData(withRootObject: uiColor, requiringSecureCoding: false)
        try container.encode(backgroundColorData, forKey: .backgroundColor)
        
        // Encode cornerRadius and boderSize as CGFloat
        try container.encode(self.cornerRadius, forKey: .cornerRadius)
        try container.encode(self.boderSize, forKey: .boderSize)
        
        // Encode borderColor as a UIColor
        let borderColorData = try NSKeyedArchiver.archivedData(withRootObject: UIColor(self.borderColor), requiringSecureCoding: false)
        try container.encode(borderColorData, forKey: .borderColor)
    }
}
