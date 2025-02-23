//
//  RowView.swift
//  CodeReviewSample
//
//  Created by Kinney Kare on 2/23/25.
//


import SwiftUI

struct RowView: View {
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Text(value)
                .font(.caption)
                .multilineTextAlignment(.trailing)
        }
        .padding(.horizontal, 8.0)
    }
}
