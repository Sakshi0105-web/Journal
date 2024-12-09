//
//  ContentView.swift
//  Journal
//
//  Created by Sakshi Anil Sindgi on 09/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(0)
            Text("Edit")
                .tabItem {
                    Image(systemName: "pencil")
                    Text("Edit")
                }
                .tag(1)
            Text("Music")
                .tabItem {
                    Image(systemName: "waveform")
                    Text("Music")
                }
                .tag(2)
            Text("Settings")
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
                .tag(3)
        }
    }
}

struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Search Bar
                    TextField("Search for your files", text: .constant(""))
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                        .padding(.horizontal)

                    // Record Button
                    VStack {
                        Text("Record your thoughts with your voice")
                            .font(.headline)
                            .multilineTextAlignment(.center)
                            .padding(.top)
                        Button(action: {
                            print("Recording started")
                        }) {
                            Text("Start recording")
                                .font(.headline)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                    .padding()
                    .background(Color.blue.opacity(0.2))
                    .cornerRadius(15)
                    .padding(.horizontal)

                    // Your Notes Section
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Your files")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.leading)

                        Group {
                            Section(header: Text("This month").font(.headline)) {
                                NoteLink(title: "Butterfly effect")
                                NoteLink(title: "The yellow umbrella")
                                NoteLink(title: "Red bow cat")
                            }
                            Section(header: Text("Previous month").font(.headline)) {
                                NoteLink(title: "Symbols of life")
                                NoteLink(title: "Voice of the hill")
                                NoteLink(title: "The purple lace")
                            }
                        }
                        .padding(.horizontal)
                    }

                    // Browse Categories Section
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Browse categories")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.leading)

                        HStack(spacing: 15) {
                            CategoryLink(imageName: "1", categoryName: "Pop")
                            CategoryLink(imageName: "2", categoryName: "Chill")
                            CategoryLink(imageName: "3", categoryName: "Jazz Beats")
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.bottom, 50) // Space for tab bar
            }
            .navigationTitle("Home")
        }
    }
}

struct NoteLink: View {
    var title: String
    var body: some View {
        NavigationLink(destination: Text("\(title) details")) {
            Text(title)
                .font(.body)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
        }
    }
}

struct CategoryLink: View {
    var imageName: String
    var categoryName: String
    var body: some View {
        NavigationLink(destination: SongListView(categoryName: categoryName)) {
            VStack {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .cornerRadius(15)
                Text(categoryName)
                    .font(.subheadline)
            }
        }
    }
}

struct SongListView: View {
    var categoryName: String
    var body: some View {
        VStack {
            Text("Songs in \(categoryName)")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            // Example list of songs
            List {
                Text("Song 1")
                Text("Song 2")
                Text("Song 3")
                Text("Song 4")
            }
        }
        .navigationTitle(categoryName)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
