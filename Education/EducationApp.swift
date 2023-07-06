//
//  EducationApp.swift
//  Education
//
//  Created by Shanim on 24/03/23.
//

import SwiftUI

@main
struct EducationApp: App {

    @Environment(\.scenePhase) var scenePhase
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
    
    var body: some Scene {
        WindowGroup {
            OnboardingView()
                .onOpenURL { url in
                    print("Incoming URL: \(url)")
                }
        }

        .onChange(of: scenePhase, perform: { newScenePhase in
            switch newScenePhase {
            case .background:
                break
            case .inactive:
                break
            case .active:
                break
            @unknown default:
                break
            }
        })
    }
}
