//
//  ButtonAndSliderViewController.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/9/24.
//

import UIKit

final class ButtonAndSliderViewController: DefaultCollectionViewController {
    
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
    
    private lazy var stackView = UIStackView()
    private lazy var sliderBoxView = ComponentBoxView([labelForSliderTitle, slider, labelForSlider])
    private lazy var disabledButton = UIButton()
    private lazy var textButton = UIButton()
    lazy var imageButton = UIButton()
    lazy var imageButtonAccessibility = UIButton()
    private lazy var textWithImageButton = UIButton()
    private lazy var textWithSubtitleButton = UIButton()
    private lazy var labelForSliderTitle = UILabel()
    lazy var slider = UISlider()
    private lazy var labelForSlider = UILabel()
    
    private var imageButtonConfiguration = UIButton.Configuration.plain()
    private var imageLightOn = UIImage(named: "light_on")
    private var imageLightOff = UIImage(named: "light_off")
    
    init() {
        super.init(isAccessible: true)
        
        configureSubViews()
        let sections = [
            "UIButton",
            "UISlider"
        ]
        
        let items = [
            Item(sectionID: 0, tag: .standard, title: "비활성화 버튼", description: "비활성화 버튼", view: disabledButton),
            Item(sectionID: 0, tag: .standard, title: "텍스트 버튼",description: "기본적인 텍스트 버튼입니다.", view: textButton),
            Item(sectionID: 0, tag: .standard, title: "이미지 버튼", description: "이미지로 구성된 버튼입니다.", view: imageButton),
            Item(sectionID: 0, tag: .improve, title: "이미지 버튼",description: "이미지에 대한 설명이 제공됩니다.", view: imageButtonAccessibility),
            Item(sectionID: 0, tag: .standard, title: "텍스트 이미지 버튼",description: "텍스트와 같은 의미의 이미지가 있는 버튼입니다.", view: textWithImageButton),
            Item(sectionID: 0, tag: .standard, title: "제목 부제목 버튼", description: "제목과 부제목이 있는 버튼입니다.", view: textWithSubtitleButton),
            Item(sectionID: 1, tag: .standard, title: "슬라이더", description: "값을 조절하는 슬라이더 입니다.", view: sliderBoxView)
        ]
        super.sections = sections
        super.items = items
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: Configuration
private extension ButtonAndSliderViewController {
    func configureSubViews() {
        [ textButton, textWithImageButton, textWithSubtitleButton ]
            .forEach{
                $0.addTarget(self, action: #selector(didTouchDown), for: .touchDown)
                $0.addTarget(self, action: #selector(didTouchUp), for: .touchUpInside)
                $0.addTarget(self, action: #selector(didTouchUp), for: .touchUpOutside)
            }
        
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
        imageButton.addTarget(self, action: #selector(didTapLightButton), for: .touchUpInside)
        
        imageButtonAccessibility.configuration = imageButtonConfiguration
        imageButtonAccessibility.clipsToBounds = true
        imageButtonAccessibility.accessibilityLabel = isLightOnForAccessibility ? "켜진 전구" : "꺼진 전구"
        imageButtonAccessibility.addTarget(self, action: #selector(didTapLightButton), for: .touchUpInside)
        
        var textWithImageConfiguration = UIButton.Configuration.filled()
        textWithImageConfiguration.image = UIImage(systemName: "pencil")
        textWithImageConfiguration.title = "작성"
        textWithImageButton.configuration = textWithImageConfiguration
        
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
        labelForSlider.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
}
