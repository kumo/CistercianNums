//
//  KeyPad.swift
//  Cistercian Numerals
//
//  Created by Robert Clarke on 07/02/21.
//

import SwiftUI

struct KeyPadRow: View {
    var keys: [String]
    
    var body: some View {
        HStack(spacing: 5) {
            ForEach(keys, id: \.self) { key in
                KeyPadButton(key: key)
            }
        }
    }
}

struct KeyPad: View {
    @Binding var string: String
    
    var body: some View {
        VStack(spacing: 5) {
            KeyPadRow(keys: ["1", "2", "3"])
            KeyPadRow(keys: ["4", "5", "6"])
            KeyPadRow(keys: ["7", "8", "9"])
            KeyPadRow(keys: ["", "0", "⌫"])
        }.environment(\.keyPadButtonAction, self.keyWasPressed(_:))
        .background(Color.clear)
        .padding(5)
    }
    
    private func keyWasPressed(_ key: String) {
        switch key {
        case "⌫":
            string.removeLast()
            if string.isEmpty { string = "0" }
        case _ where string == "0": string = key
        default: if string.count < 4 { string += key }
        }
    }
}

struct KeyPad_Previews : PreviewProvider {
    @State static var string = "1234"
    static var previews: some View {
        Group {
            KeyPad(string: $string)
        }
    }
}
