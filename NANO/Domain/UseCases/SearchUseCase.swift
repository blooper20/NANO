//
//  SearchUseCase.swift
//  NANO
//
//  Created by DwaeWoo on 2023/11/15.
//

import Foundation
import RxSwift

final class SearchUseCase {
    
    static let shared = SearchUseCase()
    let disposeBag = DisposeBag()
    
    let networks = Networks.shared
    
}

extension SearchUseCase {
    
    //MARK: - Title
    func getSearching(brand: String, text: String) -> Observable<SongsResponse> {
        return networks.getData(url: self.networks.getSearchURL() + "brand=\(brand)&\(text)")
    }
}
