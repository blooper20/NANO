//
//  Networks.swift
//  NANO
//
//  Created by DwaeWoo on 2023/11/13.
//

import Foundation
import RxSwift

class Networks {
    
    static let shared = Networks()
    
    private init() {}
    
    //MARK: - URL Components
    let urlComponent = "https://api.manana.kr/v2/karaoke/"
    
    //MARK: - Path
    let search = "search.json?"
    let release = "release.json?"
}

extension Networks {
    
    //MARK: - Search
    
    func getSearchURL() -> String {
        
        let url = urlComponent + search
        
        return url
    }
    
    //MARK: - Release
    func getReleaseURL() -> String {
        
        let url = urlComponent + release
        
        return url
    }
    
    //MARK: - API
    func getData(url: String) -> Observable<SongsResponse> {
        return Observable.create { observer in
            guard let url = URL(string: url) else {
                observer.onError(NSError(domain: "Invalid URL", code: 0))
                return Disposables.create()
            }
            
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    observer.onError(error)
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                    observer.onError(NSError(domain: "Invalid Response", code: 0))
                    return
                }
                
                do {
                    if let data = data {
                        let decodedData = try JSONDecoder().decode(SongsResponse.self, from: data)
                        observer.onNext(decodedData)
                        observer.onCompleted()
                    }
                } catch {
                    observer.onError(error)
                }
            }
            
            task.resume()
            
            return Disposables.create {
                task.cancel()
            }
        }
        
    }
    
//    func getData(url: String) async -> SongsResponse? {
//        guard let url = URL(string: url) else { return nil }
//        let request = URLRequest.init(url: url)
//        do {
//            let result:(data: Data, response: URLResponse) = try await URLSession.shared.data(for: request)
//            return try JSONDecoder().decode(SongsResponse.self, from: result.data)
//        } catch {
//            return nil
//        }
//    }
}
