//
//  TodayMainNavigationView.swift
//  Routine Pro
//
//  Created by Shaheem PP on 05/09/2024.
//

import SwiftUI

func getFormattedDate() -> String {
    // Get today's date
    let todaysDate = Date()

    // Create a DateFormatter
    let formatter = DateFormatter()

    // Set the desired date format without the suffix first
    formatter.dateFormat = "MMMM d, yyyy EEEE"

    // Get the day number to add the appropriate suffix (st, nd, rd, th)
    let calendar = Calendar.current
    let day = calendar.component(.day, from: todaysDate)

    func daySuffix(for day: Int) -> String {
        switch day {
        case 11, 12, 13:
            return "th"
        case _ where day % 10 == 1:
            return "st"
        case _ where day % 10 == 2:
            return "nd"
        case _ where day % 10 == 3:
            return "rd"
        default:
            return "th"
        }
    }

    // Format the date
    let formattedDay = formatter.string(from: todaysDate)
    
    // Get the position of the day and add the correct suffix
    let daySuffix = daySuffix(for: day)
    let dayString = String(day)
    
    // Replace the day in the formatted date with the day + suffix
    let finalFormattedDate = formattedDay.replacingOccurrences(of: dayString, with: "\(dayString)\(daySuffix)")
    
    return finalFormattedDate
}

struct TodayMainNavigationView: View {
    var body: some View {
        let todaysDate = getFormattedDate()
        
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    VStack(alignment: .leading) {
                        Text(todaysDate)
                            .font(.title3)
                    }
//                    NavigationLink(destination: HabitDetailView()) {
//                        Text("View Habit Details")
//                            .font(.headline)
//                            .foregroundColor(.blue)
//                            .padding()
//                            .background(Color.gray.opacity(0.2))
//                            .cornerRadius(10)
//                    }
//                    
//                    NavigationLink(destination: TodoListView()) {
//                        Text("Go to Todo List")
//                            .font(.headline)
//                            .foregroundColor(.blue)
//                            .padding()
//                            .background(Color.gray.opacity(0.2))
//                            .cornerRadius(10)
//                    }
//                    
//                    NavigationLink(destination: DailyProgressView()) {
//                        Text("Check Daily Progress")
//                            .font(.headline)
//                            .foregroundColor(.blue)
//                            .padding()
//                            .background(Color.gray.opacity(0.2))
//                            .cornerRadius(10)
//                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
            .navigationTitle("Today")
        }
    }
}

// Dummy views to navigate to
struct HabitDetailView: View {
    var body: some View {
        Text("Habit Details")
            .font(.largeTitle)
            .navigationTitle("Habit Details")
    }
}

struct TodoListView: View {
    var body: some View {
        Text("Todo List")
            .font(.largeTitle)
            .navigationTitle("Todo List")
    }
}

struct DailyProgressView: View {
    var body: some View {
        Text("Daily Progress")
            .font(.largeTitle)
            .navigationTitle("Daily Progress")
    }
}

#Preview {
    TodayMainNavigationView()
}
