//
//  View+Constraints.swift
//  IssueCard
//
//  Created by 링키지랩 on 10/15/24.
//

import UIKit

extension UIView {
    
    /// Adds views to the end of the receiver’s list of subviews, determining their autoresizing mask isn't translated into Auto Layout constraints.
    func addSubviews(_ views: [UIView]) {
        views
            .forEach{
                $0.translatesAutoresizingMaskIntoConstraints = false
                addSubview($0)
            }
    }
    
    /// Adds a view and define constraints to the view.
    func addPinnedSubview(_ view: UIView, inset: UIEdgeInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0), height: CGFloat?, equalTo anchor: Anchor = Anchor(top: .safeArea, leading: .safeArea, bottom: .safeArea, trailing: .safeArea)) {
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        let top = anchor.top == .view ? self.topAnchor : safeAreaLayoutGuide.topAnchor
        let leading = anchor.leading == .view ? self.leadingAnchor : safeAreaLayoutGuide.leadingAnchor
        let bottom = anchor.bottom == .view ? self.bottomAnchor : safeAreaLayoutGuide.bottomAnchor
        let trailing = anchor.trailing == .view ? self.trailingAnchor : safeAreaLayoutGuide.trailingAnchor
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: top, constant: inset.top),
            view.bottomAnchor.constraint(equalTo: bottom, constant: inset.bottom),
            view.leadingAnchor.constraint(equalTo: leading, constant: inset.left),
            view.trailingAnchor.constraint(equalTo: trailing, constant: inset.right)
        ])

        if let height = height {
            view.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    struct Anchor {
        let top: PinnedTo
        let leading: PinnedTo
        let bottom: PinnedTo
        let trailing: PinnedTo
        
        enum PinnedTo {
            case view
            case safeArea
        }
    }
}
