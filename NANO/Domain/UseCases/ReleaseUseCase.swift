//
//  ReleaseUseCase.swift
//  NANO
//
//  Created by DwaeWoo on 2023/11/17.
//

import Foundation
import RxSwift

final class ReleaseUseCase {
    
    static let shared = ReleaseUseCase()
    let disposeBag = DisposeBag()
    
    let networks = Networks.shared
    
}

extension ReleaseUseCase {
    
    //MARK: - Title
    func getRelease(brand: String) -> Observable<SongsResponse> {
        
        let today = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        let dateString = dateFormatter.string(from: today)
        
        return networks.getData(url: self.networks.getReleaseURL() + "release=\(dateString)&brand=\(brand)")
    }
}
