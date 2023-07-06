//
//  extraView.swift
//  Education
//
//  Created by Shanim on 31/03/23.
//

import SwiftUI

struct extraView: View {
    var body: some View {
        AsyncImage(url: URL(string:"https://swiftanytime-content.s3.ap-south-1.amazonaws.com/SwiftUI-Beginner/Async-Image/TestImage.jpeg")!, scale: 2) { phase in // 1
            if let image = phase.image { // 2
                // if the image is valid
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } else if phase.error != nil { // 3
                // some kind of error appears
                Text("404! \n No image available 😢")
                    .bold()
                    .font(.title)
                    .multilineTextAlignment(.center)

            } else { // 4
                // showing progress view as placeholder
                ProgressView()
                    .font(.largeTitle)
            }
        }.padding()
    }
}

struct extraView_Previews: PreviewProvider {
    static var previews: some View {
        extraView()
    }
}
