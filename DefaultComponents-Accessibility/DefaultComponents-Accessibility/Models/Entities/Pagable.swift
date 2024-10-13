//
//  Pagable.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 10/10/24.
//

import Foundation

struct Pagable<List: Hashable>: Hashable {
    var total: Int // 총 검색 결과 개수
    var start: Int // 검색 시작 위치
    let display: Int // 한 번에 표시할 검색 결과 개수
    var lastIndex: Int
}
