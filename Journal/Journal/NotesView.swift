//
//  notes.swift
//  Journal
//
//  Created by Sakshi Anil Sindgi on 11/12/24.
//

import SwiftUI

struct NotesView: View {
    @State private var text: String = ""
    @FocusState private var isTextEditorFocused: Bool

    var body: some View {
        NavigationView {
            VStack {
                TextEditor(text: $text)
                    .focused($isTextEditorFocused)
                    .padding()
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .regular, design: .default))
                    .background(Color.black)
                    .scrollContentBackground(.hidden)
                    .onTapGesture {
                        isTextEditorFocused = true // Focus the TextEditor when tapped
                    }
            }
            .background(Color.black)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                leading: Button(action: {
                    // Placeholder action for "Start writing"
                }) {
                    Text("Start writing")
                        .foregroundColor(.blue)
                },
                trailing: Button(action: {
                    saveNote()
                    isTextEditorFocused = false // Dismiss the keyboard when "Done" is pressed
                }) {
                    Text("Done")
                        .foregroundColor(.blue)
                }
            )
            .navigationTitle("Butterfly effect")
            .onAppear {
                // Automatically focus the TextEditor when the view appears
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    isTextEditorFocused = true
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }

    // Simulates saving the note
    private func saveNote() {
        print("Note saved: \(text)") // Replace this with actual save functionality
    }
}

struct NotesView_Previews: PreviewProvider {
    static var previews: some View {
        NotesView()
    }
}
