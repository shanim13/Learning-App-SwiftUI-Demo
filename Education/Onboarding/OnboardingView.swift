//
//  Onboarding.swift
//  Education
//
//  Created by Shanim on 24/03/23.
//

import SwiftUI

struct OnboardingView: View {

    @State var isActive: Bool = false
    @State var isAnimating: Bool = false
    @State var isInitialViewPresented: Bool = false

    var body: some View {

        if isActive {
            NavigationView {
                InitialView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .accentColor(.indigo)
            
        } else {
            ZStack {
                Color.indigo
                        .ignoresSafeArea()
                    Text("Learning App")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                        .shadow(color: .gray, radius: 10)
                        .scaleEffect(isAnimating ? 1.0 : 0.6)
            }
            .onAppear {
                withAnimation(.easeOut(duration: 0.5)) {
                    isAnimating = true
                }
                DispatchQueue.main.asyncAfter(deadline:.now() + 2.5){
                    self.isActive = true
                }
            }
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

