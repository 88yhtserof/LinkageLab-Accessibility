//
//  Music.swift
//  IssueCard
//
//  Created by 링키지랩 on 10/30/24.
//

import Foundation

struct Music: Hashable {
    let thumbnail: String
    let title: String
    let artist: String
}

extension Music {
    static var samples = [
        Music(thumbnail: "aespa_1", title: "whiplash", artist: "aespa"),
        Music(thumbnail: "aespa_1", title: "Supernova", artist: "aespa"),
        Music(thumbnail: "aespa_1", title: "Savage", artist: "aespa"),
        Music(thumbnail: "aespa_1", title: "Spicy", artist: "aespa"),
        Music(thumbnail: "aespa_1", title: "Set The Tone", artist: "aespa")
    ]
}
