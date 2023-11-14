//
//  Networks.swift
//  NANO
//
//  Created by DwaeWoo on 2023/11/13.
//

import Foundation
import RxSwift

class Networks {
    let url = "https://api.manana.kr/v2/karaoke/search.json?"
    
    func getSearchingTitle(brand: String, title: String) async -> SearchingTitleResponse? {
        guard let url = URL(string: url + "brand=\(brand)%title=\(title)") else { return nil }
        let request = URLRequest.init(url: url)
        do {
            let result:(data: Data, response: URLResponse) = try await URLSession.shared.data(for: request)
            return try JSONDecoder().decode(SearchingTitleResponse.self, from: result.data)
        } catch {
            return nil
        }
    }
}
