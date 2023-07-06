//
//  ModelData.swift
//  Education
//
//  Created by Shanim on 30/03/23.
//

import Foundation
import SwiftUI
import Combine

final class ModelData: ObservableObject {

    @Published var courseDataArray: [CoursesData] = load("CoursesData.json")
}

func load<T:Decodable>(_ fileName: String) -> T {

    let data: Data

    guard let file = Bundle.main.url(forResource: fileName, withExtension: nil) else {
        fatalError("Couldn't find")
    }

    do {
        data = try Data(contentsOf: file)
    }catch {
        fatalError("Couldn't find")
    }

    do{
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }catch {
        fatalError("Couldn't find")
    }

}
