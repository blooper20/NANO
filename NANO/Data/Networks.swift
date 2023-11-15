//
//  Networks.swift
//  NANO
//
//  Created by DwaeWoo on 2023/11/13.
//

import Foundation
import RxSwift

class Networks {
    
    let urlComponent = "https://api.manana.kr/v2/karaoke/"
    
    //MARK: - Path
    let search = "search.json?"
    let release = "release.json?"
    
    //MARK: - Brand
    let tj = "brand=tj&"
    let kumyoung = "brand=kumyoung&"
    let joysound = "brand=joysound&"
    let uga = "brand=uga&"
    let dam = "brand=dam&"
}

//MARK: - Function
extension Networks {
    
    //MARK: - Search
    func getSearchTJURL() -> String {
        
        let url = urlComponent + search + tj
        
        return url
    }
    
    func getSearchKumyoungURL() -> String {
        
        let url = urlComponent + search + kumyoung
        
        return url
    }
    
    func getSearchJoysoundURL() -> String {
        
        let url = urlComponent + search + joysound
        
        return url
    }
    
    func getSearchUgaURL() -> String {
        
        let url = urlComponent + search + uga
        
        return url
    }
    
    func getSearchDamURL() -> String {
        
        let url = urlComponent + search + dam
        
        return url
    }
    
    //MARK: - Release
    func getReleaseTJURL() -> String {
        
        let url = urlComponent + release + tj
        
        return url
    }
    
    func getReleaseKumyoungURL() -> String {
        
        let url = urlComponent + release + kumyoung
        
        return url
    }
    
    func getReleaseJoysoundURL() -> String {
        
        let url = urlComponent + release + joysound
        
        return url
    }
    
    func getReleaseUgaURL() -> String {
        
        let url = urlComponent + release + uga
        
        return url
    }
    
    func getReleaseDamURL() -> String {
        
        let url = urlComponent + release + dam
        
        return url
    }
}
