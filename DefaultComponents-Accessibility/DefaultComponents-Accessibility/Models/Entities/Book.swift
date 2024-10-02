//
//  Book.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/23/24.
//

import Foundation


struct Book: Hashable, Identifiable {
    var id = UUID()
    
    static func == (lhs: Book, rhs: Book) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    let title: String
    var bookmark: Bool
    
    init(title: String, bookmark: Bool = false) {
        self.title = title
        self.bookmark = bookmark
    }
}

extension Book {
    static var samples = [
        Book(title: "머니 트렌드 2025"),
        Book(title: "트렌드 코리아 2025"),
        Book(title: "불변의 법칙"),
        Book(title: "자기주관으로 나의 언어를 만들어라"),
        Book(title: "언젠가 우리가 같은 별을 바라본다면"),
        Book(title: "영원한 천국"),
        Book(title: "시대예보: 호명사회"),
        Book(title: "모순"),
        Book(title: "삶을 견디는 기쁨"),
        Book(title: "하루 한 장 나의 어휘력을 위한 필사 노트"),
        Book(title: "면도날"),
        Book(title: "어른의 감정력"),
        Book(title: "찬란한 멸종"),
        Book(title: "돈의 심리학"),
        Book(title: "왜 당신은 다른 사람을 위해 살고 있는가"),
        Book(title: "생각의 연금술"),
        Book(title: "끌리는 이들에겐 이유가 있다"),
        Book(title: "저속노화 식사법"),
        Book(title: "세이노의 가르침"),
        Book(title: "돈 공부를 시작하고 인생의 불안이 사라졌다"),
        Book(title: "THE MONEY BOOK"),
        Book(title: "오만과 편견"),
        Book(title: "도리언 그레이의 초상")
    ]
}
