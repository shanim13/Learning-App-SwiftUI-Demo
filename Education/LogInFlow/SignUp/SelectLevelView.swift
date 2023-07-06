//
//  SelectLevelView.swift
//  Education
//
//  Created by Shanim on 27/03/23.
//

import SwiftUI

struct SelectLevelView: View {

    @State var isBeginner: Bool = false
    @State var isIntermediate: Bool = false
    @State var isExpert: Bool = false
    @State var areYouSureCheck: Bool = false

    var isValid: Bool {
        areYouSureCheck && (isBeginner||isIntermediate||isExpert)
    }

    var body: some View {
        VStack{
            Text("Learning App")
                .font(.largeTitle)
                .foregroundColor(.indigo)
                .fontWeight(.heavy)
                .padding(.top, 20)

            Image("levels")
                .resizable()
                .frame(width: 400.0, height: 300.0)

            Text("Select your course level")
                .foregroundColor(.indigo)
                .font(.title2)
                .fontWeight(.regular)
                .multilineTextAlignment(.leading)

            ZStack(alignment: .center) {
                Color.purple.opacity(0.1)
                VStack(spacing: 20) {
                    HStack {
                        Button(action: {
                            if (isIntermediate || isExpert) == false {
                                isBeginner.toggle()
                            }
                        }) {
                            Text("Beginner")
                                .padding(.horizontal, 4)
                                .padding(.vertical, 10)
                        }
                        .font(.headline)
                        .fontWeight(.medium)
                        .buttonStyle(.borderedProminent)
                        .buttonBorderShape(.capsule)
                        .tint(isBeginner ? .indigo : .white)
                        .foregroundColor(isBeginner ? .white : .indigo)
                        .overlay(
                            Capsule().stroke(Color.indigo, lineWidth: 2)
                        )


                        Button(action: {
                            if (isBeginner || isExpert) == false {
                                isIntermediate.toggle()
                            }
                        }) {
                            Text("Intermediate")
                                .padding(.horizontal, 6)
                                .padding(.vertical, 10)
                        }
                        .font(.headline)
                        .fontWeight(.medium)
                        .buttonStyle(.borderedProminent)
                        .buttonBorderShape(.capsule)
                        .tint(isIntermediate ? .indigo : .white)
                        .foregroundColor(isIntermediate ? .white : .indigo)
                        .overlay(
                            Capsule().stroke(Color.indigo, lineWidth: 2)
                        )


                        Button(action: {
                            if (isBeginner || isIntermediate) == false {
                                isExpert.toggle()
                            }
                        }) {
                            Text("Expert")
                                .padding(.horizontal, 4)
                                .padding(.vertical, 10)
                        }
                        .font(.headline)
                        .fontWeight(.medium)
                        .buttonStyle(.borderedProminent)
                        .buttonBorderShape(.capsule)
                        .tint(isExpert ? .indigo : .white)
                        .foregroundColor(isExpert ? .white : .indigo)
                        .overlay(
                            Capsule().stroke(Color.indigo, lineWidth: 2)
                        )

                    }
                    .padding()

                    HStack {
                        Button(action: {
                            areYouSureCheck.toggle()
                        }) {
                            Image(systemName: self.areYouSureCheck ? "checkmark.square" : "square")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .tint(.indigo)
                        }

                        Text("Are You Sure ?")
                            .foregroundColor(.indigo)
                    }

                    NavigationLink(destination: MainTabView()) {
                        Text("Continue")
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.indigo)
                    .font(.headline)
                    .clipShape(Capsule())
                    .disabled(!self.isValid)

                    Spacer()
                }
                .padding(.top, 20)
            }
            .cornerRadius(40)
            .padding(.bottom, -40)
        }
    }
}

struct SelectLevelView_Previews: PreviewProvider {
    static var previews: some View {
        SelectLevelView()
    }
}
