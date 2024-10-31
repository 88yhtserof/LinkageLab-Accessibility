//
//  ArtistBackgroundImageView.swift
//  IssueCard
//
//  Created by 링키지랩 on 10/29/24.
//

import UIKit

final class ArtistBackgroundImageView: UIImageView {
    
    init() {
        let image = UIImage(named: "aespa_1")
        super.init(image: image)
        self.contentMode = .scaleToFill
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
