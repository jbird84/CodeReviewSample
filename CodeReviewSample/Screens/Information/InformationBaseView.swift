//
//  InformationBaseView.swift
//  CodeReviewSample
//
//  Created by Kinney Kare on 2/23/25.
//

import SwiftUI

struct InformationBaseView: View {
    private var viewModel = InformationBaseViewModel()
    
    var body: some View {
        ZStack {
            VStack(spacing: 20.0) {
                if let information = viewModel.information {
                    InformationView(information: information)
                }
                
                ActionButton(title: K.ButtonTitle.getInfo) {
                    Task {
                        await viewModel.fetchSampleNetworkData()
                    }
                }
                
                ActionButton(title: K.ButtonTitle.postInfo) {
                    Task {
                        await viewModel.postSampleNetworkData()
                    }
                }
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
        }
    }
}

struct InformationBaseView_Previews: PreviewProvider {
    static var previews: some View {
        InformationBaseView()
    }
}
