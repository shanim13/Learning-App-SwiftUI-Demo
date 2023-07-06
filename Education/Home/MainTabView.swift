//
//  MainTabView.swift
//  Education
//
//  Created by Shanim on 27/03/23.
//

import SwiftUI

//enum TabItem: String, CaseIterable {
//
//    case home
//    case book
//    case profile
//
//    var description: String {
//        switch self {
//        case .home:
//            return "Home"
//        case .book:
//            return "Book"
//        case .profile:
//            return "Profile"
//        }
//    }
//
//    var icon: String {
//        switch self {
//        case .home:
//            return "house.circle.fill"
//
//        case .book:
//            return "book.circle.fill"
//
//        case .profile:
//            return "person.circle.fill"
//        }
//    }
//}

struct MainTabView: View {

    @Environment(\.presentationMode) var presentationMode
    let userData = UserData()
//    @Environment(\.verticalSizeClass) var size
//
//    var tabItems: [TabItem]
//    @State var centerx: CGFloat = 0
//    @Binding var selected: TabItem
//
//    init(tabItems: [TabItem], selected: Binding<TabItem>) {
//        UITabBar.appearance().isHidden = true
//        self.tabItems = tabItems
//        self._selected = selected
//    }
    
    var body: some View {

            TabView {
                HomeView()
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .tabItem{
                        Image(systemName: "house.circle.fill")
                        Text("Home")
                    }.environmentObject(userData)

                ClassesView()
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .tabItem{
                        Image(systemName: "book.circle.fill")
                        Text("Classes")
                    }

                AccountView()
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .tabItem{
                        Image(systemName: "person.circle.fill")
                        Text("Account")
                    }.environmentObject(userData)
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .accentColor(.indigo)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}

//extension UIApplication {
//    static var safeAreaInsets: UIEdgeInsets  {
//        let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
//        return scene?.windows.first?.safeAreaInsets ?? .zero
//    }
//}
