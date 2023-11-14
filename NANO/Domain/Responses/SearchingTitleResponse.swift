//
//  SearchingTitleResponse.swift
//  NANO
//
//  Created by DwaeWoo on 2023/11/14.
//

import Foundation


//MARK: - SearchingTitleResponse
struct SearchingTitleResponse: Decodable {
    let data: [SongInfo?]
}

struct SongInfo: Decodable {
    let no: String
    let title: String
    let singer: String
    let composer: String
    let lyricist: String
    let release: String
}
