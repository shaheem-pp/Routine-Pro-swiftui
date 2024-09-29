//
//  ContentView.swift
//  Routine Pro
//
//  Created by Shaheem PP on 05/09/2024.
//

import SwiftUI


struct TodayView: View {
    var body: some View {
        TabView {
            TodayMainNavigationView()
                .tabItem {
                    Label("Today", systemImage: "calendar")
                }
            
            HabitsView()
                .tabItem {
                    Label("Habits", systemImage: "checkmark.circle")
                }
            
            AddButtonView()
                .tabItem {
                    Label("Add", systemImage: "plus.circle.fill")
                }
            
            TodoView()
                .tabItem {
                    Label("Todo", systemImage: "square.and.pencil")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle")
                }
        }
    }
}

#Preview {
    TodayView()
}
