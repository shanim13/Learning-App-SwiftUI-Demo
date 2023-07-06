//
//  Tutors.swift
//  Education
//
//  Created by Shanim on 31/03/23.
//

import Foundation
import SwiftUI

struct Tutors: Codable, Hashable, RandomAccessCollection {

    let results: [Results]

    func hash(into hasher: inout Hasher) {
        hasher.combine(results)
    }

    static func == (lhs: Tutors, rhs: Tutors) -> Bool {
        return lhs.results == rhs.results
    }

    var startIndex: Int { results.startIndex }
    var endIndex: Int { results.endIndex }

    subscript(position: Int) -> Results {
        results[position]
    }


}

struct Results: Codable, Hashable {

    let gender: String
    let name: Name
    let location: Location
    let email: String
    let dob: Dob
    let phone: String
    let cell: String
    let picture: Picture
    let nat: String

    func hash(into hasher: inout Hasher) {
        hasher.combine(gender)
    }

    static func == (lhs: Results, rhs: Results) -> Bool {
        return lhs.gender == rhs.gender
    }

    static let preview: Self = {
        let previewJSON: [String: Any] = [
            "gender": "male",
            "name": Name(title: "Teacher",
                       first: "John",
                       last: "Doe"),
            "location": Location(city: "San Francisco", state: "CA"),
            "email": "john.doe@example.com",
            "dob": Dob(date: "1980-01-01", age: 40),
            "phone": "555-1234",
            "cell": "555-5678",
            "picture": NSNull(),
            "nat": "US"
        ]
        
        guard let data = try? JSONSerialization.data(withJSONObject: previewJSON) else {
            fatalError("Could not make Data of \(Self.self).preview")
        }
        guard let preview = try? JSONDecoder().decode(Self.self, from: data) else {
            fatalError("Could not make preview of \(Self.self).preview")
        }
        return preview
    }()
}
