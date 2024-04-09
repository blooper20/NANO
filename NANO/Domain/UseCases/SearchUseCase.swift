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
    
    //MARK: - Singer
    func getSearchingSinger(brand: String, singer: String) -> Observable<SongsResponse> {
        return networks.getData(url: self.networks.getSearchURL() + "brand=\(brand)&singer=\(singer)")
    }
    
    //MARK: - Title
    func getSearchingTitle(brand: String, title: String) -> Observable<SongsResponse> {
        return networks.getData(url: self.networks.getSearchURL() + "brand=\(brand)&title=\(title)")
    }
}
