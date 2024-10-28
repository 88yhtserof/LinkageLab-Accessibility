//
//  NewsListViewControllerWithAccessibility+Delegate.swift
//  DefaultComponents-Accessibility
//
//  Created by 임윤휘 on 10/18/24.
//

import UIKit

extension NewsListViewControllerWithAccessibility: ButtonSupplementaryViewDelegate {
    func buttonSupplementaryView(didTapButton button: UIButton) {
        if pagable.total == News.samples.count {
            let alert = UIAlertController(title: "마지막 페이지입니다", message: "모든 페이지를 확인하셨습니다.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default))
            self.present(alert, animated: true)
            return
        }
        
        let startIndex = pagable.lastIndex + 1
        let expectedEndIndex = pagable.lastIndex + pagable.display
        
        let endIndex = expectedEndIndex < News.samples.count ? expectedEndIndex : pagable.lastIndex + (News.samples.count - pagable.lastIndex - 1)
        
        let items = Array(News.samples[startIndex...endIndex])
        updateSnapshot(newItems: items, after: pagable.lastIndex)
        
        if UIAccessibility.isVoiceOverRunning {
            Task {
                try? await announceNumOfAddedNews(count: endIndex - startIndex + 1)
            }
        }
    }
    
    @MainActor
    func announceNumOfAddedNews(count: Int) async throws {
        try await Task.sleep(for: .seconds(0.8))
        UIAccessibility.post(notification: .announcement, argument: "\(count)개의 뉴스가 추가되었습니다")
    }
}

