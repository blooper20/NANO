//
//  SearchUseCase.swift
//  NANO
//
//  Created by DwaeWoo on 2023/11/15.
//

import Foundation
import RxSwift

class SearchUseCase {
    
    let networks = Networks()
    
}

extension SearchUseCase {

//    func getSearchingTitle(brand: String, title: String) async -> SearchingTitleResponse? {
//        guard let url = URL(string: urlComponent + "brand=\(brand)%title=\(title)") else { return nil }
//        let request = URLRequest.init(url: url)
//        do {
//            let result:(data: Data, response: URLResponse) = try await URLSession.shared.data(for: request)
//            return try JSONDecoder().decode(SearchingTitleResponse.self, from: result.data)
//        } catch {
//            return nil
//        }
//    }
}
