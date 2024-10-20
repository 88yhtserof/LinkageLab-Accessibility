//
//  News.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 10/10/24.
//

import UIKit

struct News: Hashable {
    let title: String
    let content: String
}

extension News {
    static let samples = [
        News(title: "전국장애인체육대회에 출전하는 링키지랩 크루들", 
             content: """
여러분은 퇴근한 후에 혹은 주말에 운동을 하시나요? 일과 운동을 병행하는건 저에게는 참 어려운일인데요, 링키지랩 크루 중 운동 선수로 활동하고 계시는 크루들이 많으시더라구요!
이번 43회 전국장애인체육대회에 출전하신다는 소식에 링키지랩에서는 대회 이동전후에 편한하게 착용하실 수 있도록 트레이닝복을 제작하여 전달을 드렸어요!
링키지랩 참여 크루의 선전과 활약을 응원합니다!

장애인전국체전 참여 크루 명단 (4명)
- 접근성팀 : 키미 (수영), 찰리 (쇼다운)
- 카페사업팀 : 리즈 (수상 조정)
- 헬스케어파트 : 앨빈 (축구)

"""),
        News(title: "모두를 위한 공간!링키지랩 유니버셜 오피스 소개",
             content: """
안녕하세요 :) 지난번 링키지랩의 수상 소식을 듣고 장애인 편의성을 고려한 오피스 내부가 궁금하신 분들이 많으셨다고 합니다 😊
그래서 이번엔 링키지랩 성수 오피스의 근무 환경을 아주 살짝 공개해봅니다!
오피스 기획부터 완공까지 모든 크루가 편리하게 이용할 수 있도록 많은 고민과 노력이 보이실까요?
완벽하지는 않지만 장애/비장애 모두가 행복하게 일할 수 있는 공간을 위해 오늘도 고민하는 링키지랩, 앞으로도 지켜봐주세요! 💚
"""),
        News(title: "경축! 2023년 장애인고용 우수사업주로 선정되었습니다.",
             content: """
차가운 가을 바람이 코 끝에 느껴지는걸보니 2023년도 마무리가 되어가는 것 같아요! 🍁🍂
2023년의 마지막을 달려가는 이때, 또 한가지의 기쁜 소식을 가지고 왔습니다!
링키지랩이 장애인 고용에 선도적인 역할의 기여를 인정받아 2023년도에 장애인고용 우수사업주에 선정되었습니다! 🥳 2018년에 이어 두 번째 선정인데요,
링키지랩은 고용 확대와 더불어 장애인 구성원을 위한 업무 환경을 개선하기 위해서도 꾸준히 노력 중인 부분에서 높은 점수를 받았습니다!
장애인과 비장애인이 일하기 편한 근무 환경을 조성했던 노력이 빛을 발하는 순간이네요! 😊
앞으로도 함께 일하고 성장하기 좋은 회사가 될 수 있도록 지속적으로 노력하겠습니다! 💗
"""),
        News(title: "10월15일 '흰 지팡이의날'을 아시나요?",
             content: """
여러분 10월 15일이 무슨 날인지 아시나요?
1980년 세계시각장애인연합회가 시작장애인의 권리를 보장하기 위해 '흰 지팡이의 날'로 지정한 날이에요! 🧑‍🦯
흰 지팡이는 오로지 시각장애인을 위한 보조기기로, 전 세계적으로 시각장애인의 안전한 보행을 위해 사용되고 있으며 시각장애인의 이동성 및 독립성을 나타내는 상징물이기도합니다!🦯🙂
링키지랩에서는 '흰 지팡이의 날'의 의미를 알아가시기를 바라는 마음을 담아 카카오와 공동체의 헬스키퍼 룸에 '흰 지팡이'의 의미를 담아 막대 사탕을 비치해두었어요! 🍭💗
보다 많은 분들이 시각장애에 대한 이해를 높일 수 있도록 다양한 이벤트로 찾아갈게요!
"""),
        News(title: "01화 [인턴일기] 눈 떠보니 인턴이 되었습니다", content: "VPN을 설치하고 회사 협업 툴을 다운받으니 그 설렘은 배가 되었다. 모든 것이 새롭고 신기한 첫 날이었다. 앞으로 어떤 일을 해나갈지 인턴 생활이 기대"),
        News(title: "02화 [인턴일기] 두근 두근 인턴의 첫 임무", content: "첫 팀 회의 : 업무의 시작! · 화요일 아침, 출근과 함께 자리를 배정받았다. · 간단히 책상 정리를 마친 후, 드디어 첫 팀 회의에"),
        News(title: "03화 [인턴일기] 출근했습니다. 근데 이제 기타를 곁들인", content: "2주에 한 번, 수요일마다 기타를 메고 출근하는 크루원들이 있다. · 우리 회사는 신청자를 받아 2주에 한 번씩 '아트랩스'라는 프로그램을 진행 중이다.")
    ]
}
