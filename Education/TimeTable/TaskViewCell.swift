//
//  TaskViewCell.swift
//  Education
//
//  Created by Shanim on 03/04/23.
//

import SwiftUI

struct TaskViewCell: View {

    @Binding var task: Tasks

    var body: some View{
        HStack {
            Image(systemName: task.isCompleted ? "checkmark.square" : "square")
                .resizable()
                .scaledToFill()
                .frame(width: 15, height: 15)
                .onTapGesture {
                    task.isCompleted.toggle()
                }
                .tint(.indigo)
            Text(task.name)
                .font(.headline)
                .foregroundColor(.indigo)
        }
    }
}

struct TaskViewCell_Previews: PreviewProvider {

    static let task = Tasks(name: "assignment", subject: "maths", isCompleted: true)

    static var previews: some View {
        TaskViewCell(task: .constant(task))
    }
}

