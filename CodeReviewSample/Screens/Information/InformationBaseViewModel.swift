//
//  InformationBaseView.swift
//  CodeReviewSample
//
//  Created by Kinney Kare on 2/23/25.
//

import SwiftUI

@MainActor
@Observable
class InformationBaseViewModel {
    var information: InformationModel?
    var isLoading: Bool = false
    
    func fetchSampleNetworkData() async {
        isLoading = true
        defer { isLoading = false }
        
        do {
            guard let url = URL(string: K.Endpoint.anythingPath) else {
                //TODO: show alert to user or fallback view.
                Logger.shared.logEvent("The url was invalid", withCategory: K.LoggerCategory.network, andType: .error)
                return
            }
            let data = try await URLManager.shared.request(url: url, withMethod: .get)
            information = try? JSONDecoder().decode(InformationModel.self, from: data)
        } catch {
            //TODO: show alert to user or fallback view.
            Logger.shared.logEvent("Error fetching sample network data: \(error)", withCategory: K.LoggerCategory.network, andType: .error)
        }
    }
    
    func postSampleNetworkData() async {
        isLoading = true
        defer { isLoading = false }
        
        do {
            let body = JSONBody(success: true, date: Date().ISO8601Format())
            guard let url = URL(string: K.Endpoint.anythingPath) else {
                //TODO: show alert to user or fallback view.
                Logger.shared.logEvent("The url was invalid", withCategory: K.LoggerCategory.network, andType: .error)
                return
            }
            let data = try await URLManager.shared.request(url: url, withMethod: .post, andBody: body)
            information = try JSONDecoder().decode(InformationModel.self, from: data)
        } catch {
            //TODO: show alert to user or fallback view.
            Logger.shared.logEvent("Error posting sample network data: \(error)", withCategory: K.LoggerCategory.network, andType: .error)
        }
    }
}
