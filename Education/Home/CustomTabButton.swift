//
//  CustomTabButton.swift
//  Education
//
//  Created by Shanim on 04/04/23.
//

import SwiftUI

//struct CustomTabButton: View {
//
//    @Binding var selected : TabItem
//    @Binding var centerX : CGFloat
//
//    var rect : CGRect
//    var value: TabItem
//
//    var body: some View {
//        Button(action: {
//            withAnimation(.spring()){
//                selected = value
//                centerX = rect.midX
//            }
//        }, label: {
//            VStack{
//                Image(systemName: value.icon)
//                    .resizable()
//                    .renderingMode(.template)
//                    .frame(width: 26, height: 26)
//                    .foregroundColor(selected == value ? .indigo : .gray)
//
//                Text(value.description)
//                    .font(.caption)
//                    .foregroundColor(.black)
//                    .opacity(selected == value ? 1 : 0)
//            }
//            .padding(.top)
//            .frame(width: 70, height: 50)
//            .offset(y: selected == value ? -15 : 0)
//        })
//    }
//}

//struct CustomTabButton_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomTabButton()
//    }
//}
