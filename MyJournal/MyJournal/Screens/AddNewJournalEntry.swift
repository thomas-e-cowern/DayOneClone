//
//  AddNewJournalEntry.swift
//  MyJournal
//
//  Created by Thomas Cowern on 7/25/23.
//

import SwiftUI

struct AddNewJournalEntry: View {
    
    @State private var title: String = "Title"
    @State private var journalText: String = ""
    @State private var date = Date.now
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Add new journal entry...", text: $journalText, axis: .vertical)
                    .lineLimit(10, reservesSpace: true)
                    .textFieldStyle(.roundedBorder)
                
                Spacer()
                
                Text("Select a date")
                    .font(.title2)
                            DatePicker("Enter your birthday", selection: $date)
                                .datePickerStyle(GraphicalDatePickerStyle())
                                .frame(maxHeight: 400)
                
                Button {
                    // save date
                } label: {
                    Text("Set date")
                }
                .buttonStyle(.bordered)
                
                Spacer()

                    
            }
            .padding()
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        // Cancel
                    } label: {
                        Text("Save")
                    }

                }

                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        // Cancel
                    } label: {
                        Text("Cancel")
                    }

                }
            }
        }
    }
}

struct AddNewJournalEntry_Previews: PreviewProvider {
    static var previews: some View {
        AddNewJournalEntry()
    }
}
