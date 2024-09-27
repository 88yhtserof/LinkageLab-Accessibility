//
//  ButtonAndSliderViewController.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/9/24.
//

import UIKit

final class ButtonAndSliderViewController: DefaultWithScrollViewController {
    
    var sliderValue: CGFloat = 0 {
        didSet {
            labelForSlider.font = .systemFont(ofSize: sliderValue)
        }
    }
    
    var sliderValueAccessibility: CGFloat = 0 {
        didSet {
            labelForSliderAccessibility.font = .systemFont(ofSize: sliderValueAccessibility)
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
    
    private lazy var stackView = UIStackView()
    private lazy var sliderBoxView = ComponentBoxView([labelForSliderTitle, slider, labelForSlider])
    private lazy var sliderBoxViewAccessibility = ComponentBoxView([labelForSliderTitleAccessibility, sliderAccessibility, labelForSliderAccessibility])
    private lazy var disabledButton = UIButton()
    private lazy var textButton = UIButton()
    lazy var imageButton = UIButton()
    lazy var imageButtonAccessibility = UIButton()
    private lazy var textWithImageButton = UIButton()
    private lazy var textWithImageButtonAccessibility = UIButton()
    private lazy var textWithSubtitleButton = UIButton()
    private lazy var labelForSliderTitle = UILabel()
    private lazy var labelForSliderTitleAccessibility = UILabel()
    lazy var slider = UISlider()
    lazy var sliderAccessibility = UISlider()
    private lazy var labelForSlider = UILabel()
    private lazy var labelForSliderAccessibility = UILabel()
    private lazy var imageButtonBoxView = ComponentBoxView([imageButton, imageButtonAccessibility])
    private lazy var textWithImageButtonBoxView = ComponentBoxView([textWithImageButton, textWithImageButtonAccessibility])
    
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
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 30
        
        var disablesConfigration = UIButton.Configuration.filled()
        disablesConfigration.title = "완료"
        disabledButton.configuration = disablesConfigration
        disabledButton.isEnabled = false
        
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
        
        textWithImageButtonAccessibility.configuration = textWithImageConfiguration
        textWithImageButtonAccessibility.accessibilityLabel = "연필 이미지"
        textWithImageButtonAccessibility.accessibilityValue = "작성"
        
        var textWithSubtitleConfiguration = UIButton.Configuration.filled()
        textWithSubtitleConfiguration.title = "다운로드 시작하기"
        textWithSubtitleConfiguration.subtitle = "랜덤 이미지 다운로드"
        textWithSubtitleButton.configuration = textWithSubtitleConfiguration
        
        labelForSliderTitle.text = "글자 크기 조절"
        slider.maximumValue = 50
        slider.minimumValue = 10
        slider.value = Float(labelForSlider.font.pointSize)
        slider.addTarget(self, action: #selector(didChangeValue(_:)), for: .valueChanged)
        labelForSlider.text = "카카오의 자회사형 장애인 표준사업장 링키지랩은 카카오 플랫폼 서비스 운영, 디지털 접근성 컨설팅 등 IT 특화 업무와 카카오 공동체 사내 카페, 시각장애인 헬스키퍼, 스낵 큐레이션 등 전문적인 사내 복지 사업을 함께 수행하고 있습니다."

        
        sliderBoxViewAccessibility.isAccessibilityElement = true
        sliderBoxViewAccessibility.accessibilityLabel = "글자 크기 조절"
        sliderBoxViewAccessibility.accessibilityHint = "더블 탭하여 값 조절을 활성화하십시오"
        sliderBoxViewAccessibility.actionForAccessibility = didDoubleTapToSetAccessibility
        
        labelForSliderTitleAccessibility.text = "글자 크기 조절"
        sliderAccessibility.maximumValue = 50
        sliderAccessibility.minimumValue = 10
        sliderAccessibility.value = Float(labelForSlider.font.pointSize)
        sliderAccessibility.addTarget(self, action: #selector(didChangeValue(_:)), for: .valueChanged)
        labelForSliderAccessibility.text = "카카오의 자회사형 장애인 표준사업장 링키지랩은 카카오 플랫폼 서비스 운영, 디지털 접근성 컨설팅 등 IT 특화 업무와 카카오 공동체 사내 카페, 시각장애인 헬스키퍼, 스낵 큐레이션 등 전문적인 사내 복지 사업을 함께 수행하고 있습니다."
        
    }
    
    func configureConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stackView)
        
        [ disabledButton, textButton, imageButtonBoxView, textWithImageButtonBoxView, textWithSubtitleButton, sliderBoxView, sliderBoxViewAccessibility ]
            .forEach{
                $0.translatesAutoresizingMaskIntoConstraints = false
                stackView.addArrangedSubview($0)
            }
        
        let horizontalInset: CGFloat = 10
        let verticalInset: CGFloat = 50
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: verticalInset),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: horizontalInset),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -horizontalInset),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -verticalInset)
        ])
    }
}
