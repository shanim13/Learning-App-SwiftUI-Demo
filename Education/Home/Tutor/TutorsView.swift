//
//  TutorsView.swift
//  Education
//
//  Created by Shanim on 31/03/23.
//

import SwiftUI

struct TutorsView: View {

    @StateObject var viewModel = TutorsViewModel()
    
    let columns: [GridItem] = [
        GridItem(.flexible())
    ]

    var body: some View {

        VStack {
            Text("Tutors")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.indigo)

            ZStack {
                Color.purple.opacity(0.1)
                VStack {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 16) {
                            ForEach(viewModel.results, id: \.email) { user in

                                NavigationLink(
                                    destination: TutorsDetailView(tutor: user))
                                {
                                    TutorsListRowView(tutor: user)
                                        .padding(.vertical,4)
                                }
                                .onAppear {
                                    if viewModel.enableLoadMore, !viewModel.isLoadingMore, user.email == viewModel.results.last?.email {
                                        viewModel.loadMore()
                                    }
                                }
                            }
                        }
                        .padding()
                    }
                    //                    .onAppear(perform: viewModel.loadMore)
                    .onAppear {
                        viewModel.getTutors(resultsPerPage: viewModel.resultsPerPage) { _,_ in
                            viewModel.enableLoadMore = true
                        }
                    }
                    .refreshable {
                        viewModel.refresh()
                    }
                    if viewModel.isLoadingMore {
                        ProgressView()
                            .padding(.vertical, 20)
                    }
                    Spacer()
                }
            }
            .cornerRadius(40)
            .padding(.bottom, -40)
        }
        //        .toolbar(.hidden, for: .tabBar)
    }
}

struct TutorsView_Previews: PreviewProvider {
    static var previews: some View {
        TutorsView()
    }
}

