//
//  Date+Extensios.swift
//  MyJournal
//
//  Created by Thomas Cowern on 7/28/23.
//

import Foundation
import SwiftUI

extension Date {
    func dateAsString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.string(from: date)
    }
}
