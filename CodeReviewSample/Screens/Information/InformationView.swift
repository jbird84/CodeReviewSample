//
//  InformationView.swift
//  CodeReviewSample
//
//  Created by Kinney Kare on 2/23/25.
//

import SwiftUI

struct InformationView: View {
    let information: InformationModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8.0) {
            RowView(title: K.RowViewTitle.url, value: information.url.absoluteString)
            RowView(title: K.RowViewTitle.method, value: information.method)
            RowView(title: K.RowViewTitle.accept, value: information.headers.accept)
            RowView(title: K.RowViewTitle.encoding, value: information.headers.acceptEncoding)
            RowView(title: K.RowViewTitle.language, value: information.headers.acceptLanguage)
            RowView(title: K.RowViewTitle.host, value: information.headers.host)
            
            if let contentType = information.headers.contentType {
                RowView(title: K.RowViewTitle.contentType, value: contentType)
            }
            
            RowView(title: K.RowViewTitle.userAgent, value: information.headers.userAgent)
            
            if let json = information.json {
                RowView(title: K.RowViewTitle.success, value: String(json.success))
                RowView(title: K.RowViewTitle.date, value: json.date)
            }
        }
    }
}

//Preview {
//    InformationView()
//}
