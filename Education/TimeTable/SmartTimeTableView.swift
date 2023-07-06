//
//  SmartTimeTableView.swift
//  Education
//
//  Created by Shanim on 03/04/23.
//

import SwiftUI

struct Tasks : Identifiable {

    var id = UUID()
    var name: String
    var subject: String
    var isCompleted: Bool
}

enum Sections: String, CaseIterable {
    case pending = "Pending"
    case completed = "Completed"
}

struct SmartTimeTableView: View {

    @State private var tasks: [Tasks] = [Tasks(name: "Assignment", subject: "Science", isCompleted: false), Tasks(name: "Homework", subject: "Maths", isCompleted: true), Tasks(name: "Read", subject: "English", isCompleted: false)]

    var pendingTaks: [Binding<Tasks>] {
        $tasks.filter {
            !$0.isCompleted.wrappedValue
        }
    }

    var completedTaks: [Binding<Tasks>] {
        $tasks.filter{
            $0.isCompleted.wrappedValue
        }
    }
    
    var body: some View {
        
        List {
            ForEach(Sections.allCases, id: \.self){ section in
                Section(header: Text(section.rawValue).font(.title3).fontWeight(.semibold)) {

                    let filteredTasks = section == .pending ? pendingTaks: completedTaks

                    if filteredTasks.isEmpty {
                        Text("No tasks available.")
                            .font(.headline)
                            .fontWeight(.regular)
                    } else {
                        ForEach(section == .pending ? pendingTaks : completedTaks){ $task in
                            TaskViewCell(task: $task)
                        }.onDelete { indexSet in
                            indexSet.forEach { index in
                                let taskToDelete = filteredTasks[index]
                                tasks = tasks.filter { $0.id != taskToDelete.id }
                            }
                        }
                    }
                }
            }
        }
    }
}

struct SmartTimeTableView_Previews: PreviewProvider {
    static var previews: some View {
        SmartTimeTableView()
    }
}
