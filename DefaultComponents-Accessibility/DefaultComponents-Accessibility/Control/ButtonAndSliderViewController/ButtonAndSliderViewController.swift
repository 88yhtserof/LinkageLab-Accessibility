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
            imageButtonConfiguration.image = isLightOn ? imageLightOn : imageLightOff
            imageButton.configuration = imageButtonConfiguration
        }
    }
    
    var isLightOnForAccessibility: Bool = false {
        didSet {
            imageButtonConfiguration.image = isLightOnForAccessibility ? imageLightOn : imageLightOff
            imageButtonAccessibility.configuration = imageButtonConfiguration
            imageButtonAccessibility.accessibilityLabel = isLightOnForAccessibility ? "켜진 전구 이미지" : "꺼진 전구 이미지"
        }
    }
    
    private lazy var sliderBoxView = ComponentBoxView([labelForSliderTitle, slider, labelForSlider])
    private lazy var textButton = UIButton()
    lazy var imageButton = UIButton()
    lazy var imageButtonAccessibility = UIButton()
    private lazy var textWithImageButton = UIButton()
    private lazy var textWithSubtitleButton = UIButton()
    private lazy var labelForSliderTitle = UILabel()
    private lazy var slider = UISlider()
    private lazy var labelForSlider = UILabel()
    private lazy var imageButtonBoxView = ComponentBoxView([imageButton, imageButtonAccessibility])
    
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
        var textConfiguration = UIButton.Configuration.filled()
        textConfiguration.title = "로그인"
        textButton.configuration = textConfiguration
        
        imageButtonConfiguration.image = imageLightOff
        imageButton.configuration = imageButtonConfiguration
        imageButton.clipsToBounds = true
        imageButton.addTarget(self, action: #selector(didTouchUpInside), for: .touchUpInside)
        
        imageButtonAccessibility.configuration = imageButtonConfiguration
        imageButtonAccessibility.clipsToBounds = true
        imageButtonAccessibility.accessibilityLabel = isLightOnForAccessibility ? "켜진 전구 이미지" : "꺼진 전구 이미지"
        imageButtonAccessibility.addTarget(self, action: #selector(didTouchUpInside), for: .touchUpInside)
        
        imageButtonBoxView.axis = .horizontal
        
        var textWithImageConfiguration = UIButton.Configuration.filled()
        textWithImageConfiguration.image = UIImage(systemName: "pencil")
        textWithImageConfiguration.title = "작성"
        textWithImageButton.configuration = textWithImageConfiguration
        
        var textWithSubtitleConfiguration = UIButton.Configuration.filled()
        textWithSubtitleConfiguration.title = "다운로드 시작하기"
        textWithSubtitleConfiguration.subtitle = "랜덤 이미지 다운로드"
        textWithSubtitleButton.configuration = textWithSubtitleConfiguration
        
        labelForSliderTitle.text = "글자 크기 조정하기"
        slider.maximumValue = 50
        slider.minimumValue = 10
        slider.value = Float(labelForSlider.font.pointSize)
        slider.addTarget(self, action: #selector(didChangeValue(_:)), for: .valueChanged)
        labelForSlider.text = "카카오의 자회사형 장애인 표준사업장 링키지랩은 카카오 플랫폼 서비스 운영, 디지털 접근성 컨설팅 등 IT 특화 업무와 카카오 공동체 사내 카페, 시각장애인 헬스키퍼, 스낵 큐레이션 등 전문적인 사내 복지 사업을 함께 수행하고 있습니다."
    }
    
    func configureConstraints() {
        [ textButton, imageButtonBoxView, textWithImageButton, textWithSubtitleButton, sliderBoxView ]
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
            
            imageButtonBoxView.topAnchor.constraint(equalTo: textButton.bottomAnchor, constant: verticalInset),
            imageButtonBoxView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: horizontalInset),
            imageButtonBoxView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -horizontalInset),
            
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
