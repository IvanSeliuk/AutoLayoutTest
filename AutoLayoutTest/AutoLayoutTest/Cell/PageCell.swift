//
//  PageCell.swift
//  AutoLayoutTest
//
//  Created by Иван Селюк on 28.08.22.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    var page: Page? {
        didSet {
            
            guard let page = page else { return }
            kobeBrayantImage.image = UIImage(named: page.imageName)
            
            let attributedText = NSMutableAttributedString(string: page.headerText, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18), NSAttributedString.Key.foregroundColor: UIColor.lightGray])
            attributedText.append(NSAttributedString(string: page.bodyText, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 24), NSAttributedString.Key.foregroundColor: UIColor.white]))
            descriptionTextView.attributedText = attributedText
            descriptionTextView.textAlignment = .center 
        }
    }
    
    private let kobeBrayantImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Kobe Bryant"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.backgroundColor = .black
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        setupLayout()
    }
        private func setupLayout() {
            let topImageContainerView = UIView()
            addSubview(topImageContainerView)
            topImageContainerView.addSubview(kobeBrayantImage)
            topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
            addSubview(descriptionTextView)
            addConstraints([
                kobeBrayantImage.topAnchor.constraint(equalTo: topImageContainerView.topAnchor, constant: 0),
                kobeBrayantImage.trailingAnchor.constraint(equalTo: topImageContainerView.trailingAnchor, constant: 0),
                kobeBrayantImage.leadingAnchor.constraint(equalTo: topImageContainerView.leadingAnchor, constant: 0),
                kobeBrayantImage.bottomAnchor.constraint(equalTo: topImageContainerView.bottomAnchor, constant: 0),
                
                descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor, constant: 0),
                descriptionTextView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),
                descriptionTextView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),
                descriptionTextView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -50),
                
                topImageContainerView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
                topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
                topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
                topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5)
            ])
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
