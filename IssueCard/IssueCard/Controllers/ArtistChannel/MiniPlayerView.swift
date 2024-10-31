//
//  MiniPlayerView.swift
//  IssueCard
//
//  Created by 링키지랩 on 10/31/24.
//

import UIKit

class MiniPlayerView: UIView {
    
    lazy var progressView: UIProgressView = {
        var view = UIProgressView()
        view.progress = 0.3
        return view
    }()
    
    lazy var infoButton: UIButton = {
        var config = UIButton.Configuration.plain()
        config.title = "Whiplash"
        config.subtitle = "aespa"
        config.baseForegroundColor = .black
        let view = UIButton(configuration: config)
        return view
    }()
    
    lazy var beforeButton: UIButton = {
        var config = UIButton.Configuration.plain()
        config.image = UIImage(systemName: "chevron.left")
        config.baseForegroundColor = .black
        let view = UIButton(configuration: config)
        return view
    }()
    
    lazy var afterButton: UIButton = {
        var config = UIButton.Configuration.plain()
        config.image = UIImage(systemName: "chevron.right")
        config.baseForegroundColor = .black
        let view = UIButton(configuration: config)
        return view
    }()

    lazy var playButton: UIButton = {
        var config = UIButton.Configuration.plain()
        config.image = UIImage(systemName: "play.fill")
        config.baseForegroundColor = .black
        let view = UIButton(configuration: config)
        return view
    }()
    
    lazy var playStackView: UIStackView = {
        var view = UIStackView(arrangedSubviews: [beforeButton, playButton, afterButton])
        view.axis = .horizontal
        view.distribution = .fill
        return view
    }()
    
    lazy var infoBarStackView: UIStackView = {
        var view = UIStackView(arrangedSubviews: [infoButton, playStackView])
        view.axis = .horizontal
        view.distribution = .equalSpacing
        return view
    }()
    
    lazy var externalStackView: UIStackView = {
        var view = UIStackView(arrangedSubviews: [progressView, infoBarStackView])
        view.axis = .vertical
        view.distribution = .equalSpacing
        view.spacing = 0
        return view
    }()
    
    init() {
        let frame = CGRect(x: 0, y: 0, width: 0, height: 200)
        super.init(frame: frame)
        
        backgroundColor = .white
        addPinnedSubview(externalStackView, height: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
