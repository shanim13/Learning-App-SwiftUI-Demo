//
//  emptyTextFieldView.swift
//  Education
//
//  Created by Shanim on 29/03/23.
//

import SwiftUI

struct EmptyTextFieldView: ViewModifier {
    
    @Binding var text: String
    @State var showPassword: Bool = false

    func body(content: Content) -> some View {
        HStack {
            content

            Button {
                showPassword.toggle()
            } label: {
                Image(systemName: showPassword ? "eye.slash" : "eye")
                    .foregroundColor(.indigo)
            }
        }
    }
}
