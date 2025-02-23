//
//  LoadingView.swift
//  CodeReviewSample
//
//  Created by Kinney Kare on 2/23/25.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.black)
                .opacity(0.2)
                .ignoresSafeArea()
            ProgressView()
        }
    }
}

#Preview {
    LoadingView()
}
