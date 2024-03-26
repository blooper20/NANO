//
//  SongDetailInfoView.swift
//  NANO
//
//  Created by DwaeWoo on 2024/01/17.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

final class SongDetailInfoView: UIView, ContentViewDelegating {
    
    //MARK: - Declaration
    weak var viewController: UIViewController?
    weak var delegate: ContentViewDelegate?
    
    private let disposebag = DisposeBag()

    var brandLabel: UILabel = {
        let label = UILabel()
        label.textColor = .main
        label.textAlignment = .center
        label.font = .labelText
        label.sizeToFit()
        
        return label
    }()
    
    var numberLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .labelText
        label.textAlignment = .center
        label.sizeToFit()
        
        return label
    }()
    
    var releaseLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray2
        label.font = .labelSubText
        label.textAlignment = .center
        label.sizeToFit()
        
        return label
    }()
    
    var songTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .labelText
        label.numberOfLines = 0
        label.sizeToFit()
        
        return label
    }()
    
    var singerLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .labelText
        label.sizeToFit()
        
        return label
    }()
    
    var composerLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .labelText
        label.sizeToFit()
        
        return label
    }()
    
    var lyricistLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .labelText
        label.sizeToFit()
        
        return label
    }()
    
    lazy var reserveButton: MainButton = {
        let button = MainButton(title: "예약하기")
        button.rx.tap.subscribe(onNext: { [weak self] in
            if let delegate = self?.delegate {  
                delegate.contentViewAction(presentView: PlaylistSelectView(), hasNavigation: true)
            }    
        }).disposed(by: disposebag)

        return button
    }()
    
    //MARK: - Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpViews()
        bind(songInfo: .init(no: "1234", title: "asdfasdjgfgfff kg k kg kfgfgkgfgjfgf", singer: "asdfasdf", composer: "ghghgghf", lyricist: "asdffgbb", release: "gggdgd"))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension SongDetailInfoView {
    
    //MARK: - Function
    private func setUpViews() {
        self.addSubview(brandLabel)
        brandLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(calculatingWidth(width: 38))
            make.top.equalToSuperview().offset(calculatingHeight(height: 10))
        }
        
        self.addSubview(numberLabel)
        numberLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(calculatingWidth(width: 38))
            make.top.equalTo(brandLabel.snp.bottom).offset(calculatingHeight(height: 5))
        }
        
        self.addSubview(releaseLabel)
        releaseLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(calculatingWidth(width: 38))
            make.top.equalTo(numberLabel.snp.bottom).offset(calculatingHeight(height: 5))
        }
        
        self.addSubview(songTitleLabel)
        songTitleLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(calculatingWidth(width: 38))
            make.top.equalTo(releaseLabel.snp.bottom).offset(calculatingHeight(height: 20))
        }
        
        self.addSubview(singerLabel)
        singerLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(calculatingWidth(width: 38))
            make.top.equalTo(songTitleLabel.snp.bottom).offset(calculatingHeight(height: 20))
        }
        
        self.addSubview(composerLabel)
        composerLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(calculatingWidth(width: 38))
            make.top.equalTo(singerLabel.snp.bottom).offset(calculatingHeight(height: 20))
        }
        
        self.addSubview(lyricistLabel)
        lyricistLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(calculatingWidth(width: 38))
            make.top.equalTo(composerLabel.snp.bottom).offset(calculatingHeight(height: 20))
        }
        
        self.addSubview(reserveButton)
        reserveButton.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(calculatingWidth(width: 76))
            make.top.equalTo(lyricistLabel.snp.bottom).offset(calculatingHeight(height: 60))
            make.bottom.equalToSuperview().inset(calculatingHeight(height: 70))
        }
    }
    
    func bind(songInfo: SongInfo) {
        brandLabel.text = AppState.shared.brand
        numberLabel.text = "no.\(songInfo.no)"
        releaseLabel.text = songInfo.release
        songTitleLabel.text = "제목: \(songInfo.title)"
        singerLabel.text = "가수: \(songInfo.singer)"
        composerLabel.text = "작곡: \(songInfo.composer)"
        lyricistLabel.text = "작사: \(songInfo.lyricist)"
    }
}
