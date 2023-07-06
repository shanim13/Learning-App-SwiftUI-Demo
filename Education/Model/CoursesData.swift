//
//  CoursesData.swift
//  Education
//
//  Created by Shanim on 30/03/23.
//

import Foundation
import SwiftUI

struct CoursesData: Hashable, Codable, Identifiable {
    
    var id: Int
    var name: String
    var subject: String
    var isPremium: Bool
    var duration: String
    var description: String
    var price: String

    private var imageName: String

    var image: Image {
        Image(imageName)
    }
}
