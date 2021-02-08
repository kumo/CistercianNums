//
//  KeyPadButton.swift
//  Cistercian Numerals
//
//  Created by Robert Clarke on 07/02/21.
//

import SwiftUI

struct KeyPadButton: View {
    var key: String
    
    var body: some View {
        Button(action: { self.action(self.key) }) {
            Color.clear
                .overlay(RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.accentColor))
                .overlay(Text(key)
                            .font(.largeTitle))
        }
        .background(Color.green)
        .cornerRadius(5)
    }
    
    enum ActionKey: EnvironmentKey {
        static var defaultValue: (String) -> Void { { _ in } }
    }
    
    @Environment(\.keyPadButtonAction) var action: (String) -> Void
}

extension EnvironmentValues {
    var keyPadButtonAction: (String) -> Void {
        get { self[KeyPadButton.ActionKey.self] }
        set { self[KeyPadButton.ActionKey.self] = newValue }
    }
}

struct KeyPadButton_Previews: PreviewProvider {
    static var previews: some View {
        KeyPadButton(key: "8")
            .padding()
            .frame(width: 80, height: 80)
            .previewLayout(.sizeThatFits)
    }
}
