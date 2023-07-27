//
//  View+Extensions.swift
//  MyJournal
//
//  Created by Thomas Cowern on 7/27/23.
//

import Foundation
import SwiftUI

extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}
