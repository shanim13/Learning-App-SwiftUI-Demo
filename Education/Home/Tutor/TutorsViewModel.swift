//
//  TutorsViewModel.swift
//  Education
//
//  Created by Shanim on 31/03/23.
//

import Foundation
import SwiftUI
import IQAPIClient

class TutorsViewModel: ObservableObject {

    @Published var results = [Results]()
    @Published var isRefreshing = false
    @Published var isLoadingMore = false
    @Published var enableLoadMore = false
    @Published var isLoading = true

    var resultsPerPage = 10

    func refresh() {
        isRefreshing = true

        getTutors(resultsPerPage: resultsPerPage) { tutors, error in
            if let tutors = tutors {
                self.results = tutors
                self.resultsPerPage = 10
                self.enableLoadMore = true
            } else if let error = error {
                print("Error fetching tutors: \(error)")
            }
            self.isRefreshing = false
        }
    }

    func loadMore() {
        isLoadingMore = true

        getTutors(resultsPerPage: resultsPerPage + 5) { fetchedTutors, error in
            if let fetchedTutors = fetchedTutors {
                self.results.append(contentsOf: fetchedTutors)
                self.resultsPerPage += 5
            } else if let error = error {
                print("Error fetching tutors: \(error)")
            }

            self.isLoadingMore = false
        }
    }

    func getTutors(resultsPerPage: Int, completion: @escaping ([Results]?, Error?) -> Void) {

        guard var components = URLComponents(string: "https://randomuser.me/api/") else {
            return
        }

        components.queryItems = [
            URLQueryItem(name: "results", value: "\(resultsPerPage)")
        ]

        guard let url = components.url else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }

            guard let data = data else {
                return
            }

            do {
                let response = try JSONDecoder().decode(Tutors.self, from: data)
                DispatchQueue.main.async {
                    completion(response.results, nil)
                }
            } catch {
                completion(nil, error)
            }
        }.resume()
    }

    //    func getTutors() {
    //
    //            guard let url = URL(string: "https://randomuser.me/api/?results=15") else {
    //                return
    //            }
    //
    //            URLSession.shared.dataTask(with: url) { data, response, error in
    //                if let error = error {
    //                    print(error.localizedDescription)
    //                    return
    //                }
    //
    //                guard let data = data else {
    //                    return
    //                }
    //
    //                do {
    //                    let response = try JSONDecoder().decode(Tutors.self, from: data)
    //                    DispatchQueue.main.async {
    //                        self.results = response.results
    //                    }
    //                } catch {
    //                    print(error.localizedDescription)
    //                }
    //            }.resume()
    //    }
}
