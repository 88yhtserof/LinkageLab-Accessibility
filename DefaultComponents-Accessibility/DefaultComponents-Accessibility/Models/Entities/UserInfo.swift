//
//  UserInfo.swift
//  DefaultComponents-Accessibility
//
//  Created by 임윤휘 on 10/25/24.
//

import Foundation

struct UserInfo: Hashable, Identifiable {
    var id = UUID()
    var nickname: String
}

extension UserInfo {
    static var recents = [
        UserInfo(nickname: "하퍼"),
        UserInfo(nickname: "올리"),
        UserInfo(nickname: "하니"),
        UserInfo(nickname: "아일라")
    ]
    
    static var samples = [
        UserInfo(nickname: "하퍼"),
        UserInfo(nickname: "올리"),
        UserInfo(nickname: "하니"),
        UserInfo(nickname: "아일라"),
        UserInfo(nickname: "칸"),
        UserInfo(nickname: "아마라"),
        UserInfo(nickname: "이든"),
        UserInfo(nickname: "미아"),
        UserInfo(nickname: "듀이"),
        UserInfo(nickname: "찰리"),
        UserInfo(nickname: "듀오"),
        UserInfo(nickname: "키미"),
        UserInfo(nickname: "수"),
        UserInfo(nickname: "곤"),
        UserInfo(nickname: "제이크"),
        UserInfo(nickname: "데이비드"),
        UserInfo(nickname: "줄리안"),
        UserInfo(nickname: "에리카"),
        UserInfo(nickname: "조셉"),
        UserInfo(nickname: "스텔라")
    ]
}
