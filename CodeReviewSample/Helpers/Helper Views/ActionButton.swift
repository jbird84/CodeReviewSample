//
//  ActionButton.swift
//  CodeReviewSample
//
//  Created by Kinney Kare on 2/23/25.
//

import SwiftUI


struct ActionButton: View {
    let title: String
    let action: () async -> Void
    
    var body: some View {
        Button(action: {
            Task {
                await action()
            }
        }) {
            Text(title)
        }
    }
}


#Preview {
    ActionButton(title: "Wow So Cool", action: {print("Wow So Cool")})
}
