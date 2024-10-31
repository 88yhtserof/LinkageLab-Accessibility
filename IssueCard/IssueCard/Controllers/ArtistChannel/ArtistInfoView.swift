//
//  ArtistInfoView.swift
//  IssueCard
//
//  Created by 링키지랩 on 10/30/24.
//

import UIKit

final class ArtistInfoView: UIView {
    private lazy var nameLabel: UILabel = {
        var view = UILabel()
        view.text = "asepa"
        view.font = .systemFont(ofSize: 40, weight: .bold)
        return view
    }()
    
    private lazy var infoLabel: UILabel = {
        var view = UILabel()
        view.text = "발매곡 91 데뷔 2020.11.17"
        view.font = .systemFont(ofSize: 15, weight: .light)
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        var view = UIStackView(arrangedSubviews: [nameLabel, infoLabel])
        view.axis = .vertical
        view.spacing = 5
        view.distribution = .equalSpacing
        view.alignment = .leading
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension ArtistInfoView {
    func configureConstraints() {
        addPinnedSubview(stackView, height: nil)
    }
}
