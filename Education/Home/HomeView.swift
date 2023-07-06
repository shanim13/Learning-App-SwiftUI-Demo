//
//  HomeView.swift
//  Education
//
//  Created by Shanim on 27/03/23.
//

import SwiftUI

struct HomeView: View {

    private static let initialColumns: Int = 1

    @EnvironmentObject var userData: UserData

    @State private var subject: Subject?
    @State var gridColumns = Array(repeating: GridItem(.flexible()), count: initialColumns)
    @State var profileBtnTapped: Bool = false
    @State var isTimeTableOpen: Bool = false
    @State var isBuyCourseOpen: Bool = false
    @State var isTutorsViewOpen: Bool = false
    @State var presentingModal = false

    @State private var lastClasses = [
        Subject(title: "Draw and Paint", image: "draw", subject: "Art & Craft", duration: "1hr", progress: 40),
        Subject(title: "Programming", image: "programming", subject: "Computers", duration: "3hr:30min", progress: 100),
        Subject(title: "Physics", image: "science", subject: "Science", duration: "2hrs", progress: 60),
        Subject(title: "Integration", image: "maths", subject: "Mathematics", duration: "2hr:30min", progress: 85),]
    
    var body: some View {

        ZStack {
            NavigationLink(destination: PurchaseView(), isActive: $isBuyCourseOpen) {
                Color.clear
            }

            NavigationLink(destination: TutorsView(), isActive: $isTutorsViewOpen) {
                Color.clear
            }

            NavigationLink(destination: SmartTimeTableView(), isActive: $isTimeTableOpen) {
                Color.clear
            }

            NavigationView {
                ScrollView {
                    VStack {
                        Text("Welcome Back \nJohn Doe")
                            .foregroundColor(.indigo)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                        //                            .padding(.leading, 0)
                            .padding(.trailing, 80)
                            .padding(.top, 10)

                        HStack {

                            Button("Buy Courses"){
                                isBuyCourseOpen = true
                            }
                            .foregroundColor(.white)
                            .font(.title3)
                            .fontWeight(.medium)
                            .buttonStyle(.borderedProminent)
                            .tint(.indigo)

                            Button("Time Table"){
                                isTimeTableOpen = true
                            }
                            .foregroundColor(.white)
                            .font(.title3)
                            .fontWeight(.medium)
                            .buttonStyle(.borderedProminent)
                            .tint(.indigo)

                            //                            NavigationLink(destination: SmartTimeTableView()) {
                            //                                Text("Time Table")

                            //                            }

                        }.padding(.trailing, 70)
                            .padding(.top, 10)
                            .padding(.bottom, 20)

                        GroupBox{
                            Text("We have the best tutors form all over the world to guide you for the best of your future.")
                                .foregroundColor(.indigo)
                                .font(.callout)
                                .fontWeight(.medium)
                                .multilineTextAlignment(.leading)
                                .lineLimit(3)

                            Button("Check Out Here"){
                                isTutorsViewOpen = true
                            }
                            .font(.callout)
                            .fontWeight(.regular)
                            .buttonStyle(.borderedProminent)
                            .tint(.indigo)

                            //                            NavigationLink(destination: TutorsView(), label: {
                            //                                Text("Check Out Here")
                            //                                    .font(.callout)
                            //                                    .fontWeight(.regular)
                            //                            })
                            //                            .buttonStyle(.borderedProminent)
                            //                            .tint(.indigo)
                        }
                        .padding(.leading, 15)
                        .padding(.trailing, 10)
                        .frame(height: 150)


                        ZStack {
                            Color.purple.opacity(0.1)
                            VStack {
                                Text("Last Classes")
                                    .foregroundColor(.indigo)
                                    .font(.title)
                                    .fontWeight(.medium)
                                    .multilineTextAlignment(.leading)
                                    .padding(.leading, 0)
                                    .padding(.trailing, 170)
                                    .padding(.top, 10)

                                ScrollView(.horizontal, showsIndicators: false) {
                                    LazyHGrid(rows: gridColumns){
                                        ForEach(lastClasses) {subject in
                                            NavigationLink(destination: CourseCollectionView(subject: subject)) {
                                                VStack {
                                                    Image(subject.image)
                                                        .resizable()
                                                        .frame(width: 280, height: 200)
                                                        .foregroundColor(.accentColor)
                                                        .cornerRadius(8)
                                                        .shadow(color: .gray, radius: 10)

                                                    Text(subject.subject)
                                                        .font(.title3)
                                                        .fontWeight(.regular)
                                                        .foregroundColor(.indigo)
                                                        .multilineTextAlignment(.leading)

                                                    Text(subject.title)
                                                        .font(.title)
                                                        .fontWeight(.medium)
                                                        .foregroundColor(.indigo)
                                                        .multilineTextAlignment(.leading)

                                                    Text(subject.duration)
                                                        .font(.subheadline)
                                                        .fontWeight(.regular)
                                                        .foregroundColor(.indigo)
                                                        .multilineTextAlignment(.leading)
                                                }
                                                .padding(.leading, 20)
                                                .padding(.trailing, 10)
                                            }
                                        }
                                    }
                                    .frame(height: 300)
                                    .padding(.top, 20)
                                    .padding(.bottom, 40)
                                }
                            }
                            .padding(.top, 10)
                        }
                        .cornerRadius(40)
                    }
                }
                .navigationBarTitle("Home", displayMode: .inline)


                .toolbar {
                    ToolbarItem {
                        Button {
                            profileBtnTapped = true
                            self.presentingModal = true
                        } label: {

                            if let imageData = userData.selectedImage,
                               let uiImage = UIImage(data: imageData) {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                    .tint(.indigo)
                                    .cornerRadius(12.5)
                            } else {
                                Image(systemName: "person.circle.fill")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                    .tint(.indigo)
                            }
                        }
                    }
                }
                .sheet(isPresented: $profileBtnTapped) {
                    NavigationView {
                        ProfileView(presentedAsModel: $presentingModal)
                    }
                }
            }
            //        .navigationBarTitle("Home", displayMode: .inline)
            //        .toolbarBackground(Color.indigo, for: .navigationBar)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(UserData())
    }
}
