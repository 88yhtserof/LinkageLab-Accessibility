//
//  PageViewControllerWithAccessibility+DataSource.swift
//  DefaultComponents-Accessibility
//
//  Created by 임윤휘 on 10/6/24.
//

import UIKit

extension PageViewControllerWithAccessibility: UIPageViewControllerDataSource {
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pages.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let firstVC = pageViewController.viewControllers?.first,
              let currentIndex = pages.firstIndex(of: firstVC) else { return 0 }
        return currentIndex
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController) else { return vc1 }
        let beforeIndex = currentIndex - 1
        if beforeIndex < 0 {
            return vc3
        }
        return pages[beforeIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController) else { return vc3 }
        let afterIndex = currentIndex + 1
        if afterIndex >= pages.count {
            return vc1
        }
        return pages[afterIndex]
    }
}
