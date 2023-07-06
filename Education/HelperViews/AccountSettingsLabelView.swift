//
//  AccountSettingsLabelView.swift
//  Education
//
//  Created by Shanim on 27/03/23.
//

import SwiftUI

struct AccountSettingsLabelView: View {
    
    var labelText: String
    var labelImage: String
    var labelColor: Color

    var body: some View {
        HStack {
            Text(labelText).fontWeight(.bold)
                .foregroundColor(labelColor)
                .font(.title3)
            Spacer()
            Image(systemName: labelImage)
                .resizable()
                .foregroundColor(labelColor)
                .frame(width: 10, height: 10)
        }
    }
}

struct AccountSettingsLabelView_Previews: PreviewProvider {
    static var previews: some View {
        AccountSettingsLabelView(labelText: "Account Settings", labelImage: "arrow.right", labelColor: .indigo )
            .padding()
    }
}
