//
//  ContentView.swift
//  DataSharingApp
//
//  Created by MaxMobile Software on 22/11/2023.
//

import SwiftUI

struct ContentView: View {
    
    let sharedDefault = UserDefaults(suiteName: "group.TestLocalPackage")!
    
    @State private var text: String = ""
    
    @State private var backgroundColor: Color = .clear
    @State private var borderColor: Color = .black
    @State private var cornerRadius: CGFloat = 10
    @State private var borderSize: CGFloat = 5
    
    var body: some View {
        VStack {
            TextField("text", text: $text)
            
            ColorPicker("Select background Color: \(backgroundColor.description)", selection: $backgroundColor)
            
            ColorPicker("Select border Color: \(borderColor.description)", selection: $borderColor)
            
            Button(action: {
                do {
                    
                    let model = DataModel(backgroundColor: backgroundColor, cornerRadius: cornerRadius, boderSize: borderSize, borderColor: borderColor)
                    
                    try self.sharedDefault.setObject(model, forKey: "model.data")
                } catch {
                    print(error.localizedDescription)
                }
                
            }, label: {
                Text("Save")
            })
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
