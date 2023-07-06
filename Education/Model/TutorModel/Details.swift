//
//  Info.swift
//  Education
//
//  Created by Shanim on 31/03/23.
//

import Foundation
import SwiftUI

struct Id: Codable {
    let name: String
    let value: String
}

struct Name: Codable {
    let title: String
    let first: String
    let last: String
}

struct Location: Codable {
    let city: String
    let state: String
//    let country: String
//    let postcode: Int
}

struct Picture: Codable {
    let large: String
    let medium: String
    let thumbnail: String
}

struct Dob: Codable {
    let date: String
    let age: Int
}

