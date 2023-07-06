//
//  Subject.swift
//  Education
//
//  Created by Shanim on 27/03/23.
//

import Foundation
import SwiftUI

struct Subject: Identifiable, Equatable {

    var id = UUID()
    var title: String
    var image: String
    var subject: String
    var duration: String
    var progress: Double
}
