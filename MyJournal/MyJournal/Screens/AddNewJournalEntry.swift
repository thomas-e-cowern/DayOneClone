//
//  AddNewJournalEntry.swift
//  MyJournal
//
//  Created by Thomas Cowern on 7/25/23.
//

import SwiftUI
import PhotosUI
import RealmSwift

class Hotdog: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var name = ""
}

struct AddNewJournalEntry: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var title: String = "\(FormatDate().dateAsString(date: Date.now))"
    @State private var journalText: String = ""
    @State private var date = Date.now
    
    @State private var images: [UIImage] = []
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    
    @FocusState private var journalEntryIsFocused: Bool
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Add new journal entry...", text: $journalText, axis: .vertical)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .lineLimit(10, reservesSpace: true)
                    .border(Color("PrimaryColor"))
                
                Spacer()
                
                VStack {
                    DatePicker("Choose a date", selection: $date)
                        .datePickerStyle(.automatic)
                        .padding(.bottom, 10)
                    
                    Button {
                        // assign date
                        title = "\(FormatDate().dateAsString(date: date))"
                    } label: {
                        Text("Set date")
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 15)
                    }
                    .background(Color("PrimaryColor"))
                    .cornerRadius(5.0)
                }
                .padding(.horizontal, 5)
                .padding(.bottom, 50)
                
                Spacer()

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        PhotosPicker(
                            selection: $selectedItem,
                            matching: .images,
                            photoLibrary: .shared()
                        ) {
                            Image(systemName: "camera")
                                .font(.system(size: 50))
                                .foregroundColor(Color("PrimaryColor"))
                                .font(.headline)
                        }
                        .onChange(of: selectedItem) { newItem in
                            Task {
                                // Retrive selected asset in the form of Data
                                if let data = try? await newItem?.loadTransferable(type: Data.self) {
                                    selectedImageData = data
                                    if let selectedImageData {
                                        if let uiImage = UIImage(data: selectedImageData) {
                                            images.append(uiImage)
                                        }
                                    }
                                }
                            }
                        }

                        ForEach(images, id: \.self) { image in
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                        }
                    }
      
                }
            }
            .padding()
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        // Save entry useing realm
                        if let realm = try? Realm() {
                            let entry = Entry()
                            entry.text = journalText
                            entry.date = date
                            for image in images {
                                let picture = Picture(image: image)
                                entry.pictures.append(picture)
                                picture.entry = entry
                            }
                            
                            try? realm.write {
                                print("Entry added")
                                realm.add(entry)
                               
                            }
                        }
                        
                        dismiss()
                        
                    } label: {
                        Text("Save")
                            .foregroundColor(.white)
                    }

                }

                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                            .foregroundColor(.white)
                    }

                }
            }
            .toolbarBackground(Color("PrimaryColor"), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
}

struct AddNewJournalEntry_Previews: PreviewProvider {
    static var previews: some View {
        AddNewJournalEntry()
    }
}
