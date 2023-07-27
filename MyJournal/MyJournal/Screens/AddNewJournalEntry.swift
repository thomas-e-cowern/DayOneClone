//
//  AddNewJournalEntry.swift
//  MyJournal
//
//  Created by Thomas Cowern on 7/25/23.
//

import SwiftUI

struct AddNewJournalEntry: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var title: String = "\(FormatDate().dateAsString(date: Date.now))"
    @State private var journalText: String = ""
    @State private var date = Date.now
    
    let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter
    }()
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Add new journal entry...", text: $journalText, axis: .vertical)
                    .lineLimit(10, reservesSpace: true)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .border(Color("PrimaryColor"))
                
                Spacer()
                
                VStack {
                    DatePicker("Choose a date", selection: $date)
                        .datePickerStyle(.automatic)
                        .padding(.bottom, 10)
                    
                    Button {
                        // save date
                        title = "\(FormatDate().dateAsString(date: date))"
                    } label: {
                        Text("Set date")
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding(.horizontal, 5)
                .padding(.bottom, 50)
                
                Spacer()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    Button {
                        // Show photos
                    } label: {
                        Image(systemName: "camera")
                            .font(.system(size: 50))
                            .foregroundColor(Color("PrimaryColor"))
                            .font(.headline)
                    }

                }
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
                        dismiss()
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
