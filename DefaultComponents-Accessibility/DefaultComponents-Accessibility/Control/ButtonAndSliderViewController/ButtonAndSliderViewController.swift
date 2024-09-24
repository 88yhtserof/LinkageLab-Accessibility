//
//  ButtonAndSliderViewController.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/9/24.
//

import UIKit

final class ButtonAndSliderViewController: DefaultViewController {
    
    var sliderValue: CGFloat = 0 {
        didSet {
            labelForSlider.font = .systemFont(ofSize: sliderValue)
        }
    }
    
    var isLightOn: Bool = false {
        didSet {
            imageButtonConfiguration.image = isLightOn ? imageLightOff : imageLightOn
            imageButton.configuration = imageButtonConfiguration
        }
    }
    
    private lazy var sliderBoxView = ComponentBoxView([slider, labelForSlider])
    private lazy var textButton = UIButton()
    private lazy var imageButton = UIButton()
    private lazy var textWithImageButton = UIButton()
    private lazy var textWithSubtitleButton = UIButton()
    private lazy var slider = UISlider()
    private lazy var labelForSlider = UILabel()
    
    private var imageButtonConfiguration = UIButton.Configuration.plain()
    private var imageLightOn = UIImage(named: "light_on")
    private var imageLightOff = UIImage(named: "light_off")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubViews()
        configureConstraints()
    }
}

// MARK: Configuration
private extension ButtonAndSliderViewController {
    func configureSubViews() {
        var textConfiguration = UIButton.Configuration.plain()
        textConfiguration.title = "텍스트 타입"
        textButton.configuration = textConfiguration
        
        imageButtonConfiguration.image = imageLightOff
        imageButton.configuration = imageButtonConfiguration
        imageButton.clipsToBounds = true
        imageButton.addTarget(self, action: #selector(didTouchUpInside), for: .touchUpInside)
        
        var textWithImageConfiguration = UIButton.Configuration.plain()
        textWithImageConfiguration.image = UIImage(systemName: "pencil")
        textWithImageConfiguration.title = "연필"
        textWithImageButton.configuration = textWithImageConfiguration
        
        var textWithSubtitleConfiguration = UIButton.Configuration.plain()
        textWithSubtitleConfiguration.title = "더보기"
        textWithSubtitleConfiguration.subtitle = "상세 내용이 궁금하다면 더보기를 탭하세요"
        textWithSubtitleButton.configuration = textWithSubtitleConfiguration
        
        slider.maximumValue = 50
        slider.minimumValue = 10
        slider.value = Float(labelForSlider.font.pointSize)
        slider.addTarget(self, action: #selector(didChangeValue(_:)), for: .valueChanged)
        labelForSlider.text = "Slider를 조정하면 글자 크기가 변경됩니다."
    }
    
    func configureConstraints() {
        [ textButton, imageButton, textWithImageButton, textWithSubtitleButton, sliderBoxView ]
            .forEach{
                $0.translatesAutoresizingMaskIntoConstraints = false
                view.addSubview($0)
            }
        
        let verticalInset: CGFloat = 20
        let horizontalInset: CGFloat = 10
        
        NSLayoutConstraint.activate([
            textButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: verticalInset),
            textButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: horizontalInset),
            textButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -horizontalInset),
            
            imageButton.topAnchor.constraint(equalTo: textButton.bottomAnchor, constant: verticalInset),
            imageButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: horizontalInset),
            imageButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -horizontalInset),
            
            textWithImageButton.topAnchor.constraint(equalTo: imageButton.bottomAnchor, constant: verticalInset),
            textWithImageButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: horizontalInset),
            textWithImageButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -horizontalInset),
            
            textWithSubtitleButton.topAnchor.constraint(equalTo: textWithImageButton.bottomAnchor, constant: verticalInset),
            textWithSubtitleButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: horizontalInset),
            textWithSubtitleButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -horizontalInset),
            
            sliderBoxView.topAnchor.constraint(equalTo: textWithSubtitleButton.bottomAnchor, constant: verticalInset),
            sliderBoxView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: horizontalInset),
            sliderBoxView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -horizontalInset),
        ])
    }
}
