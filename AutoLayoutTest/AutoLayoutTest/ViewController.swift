//
//  ViewController.swift
//  AutoLayoutTest
//
//  Created by Иван Селюк on 23.08.22.
//

import UIKit

class ViewController: UIViewController {

    let kobeBrayantImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Kobe Bryant"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        let attributedText = NSMutableAttributedString(string: "Kobe Bryant (1978-2020) was one of the most accomplished and celebrated athletes of all time. Over the course of his twenty-year career―all played with the Los Angeles Lakers―he won five NBA championships, two Olympic gold medals, eighteen All-Star selections, and four All-Star Game MVP awards, among many other achievements before retiring in 2016.", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18), NSAttributedString.Key.foregroundColor: UIColor.white])
        attributedText.append(NSAttributedString(string: "\n\nHe is Legend!\n R.I.P.", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 24), NSAttributedString.Key.foregroundColor: UIColor.yellow]))
        textView.attributedText = attributedText
        textView.textAlignment = .center
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.backgroundColor = .black
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(descriptionTextView)
        view.backgroundColor = .black
        
        setupLayout()
        
    }
    
    private func setupLayout() {
        let topImageContainerView = UIView()
        topImageContainerView.backgroundColor = .black
        view.addSubview(topImageContainerView)
        topImageContainerView.addSubview(kobeBrayantImage)
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        
        view.addConstraints([
            kobeBrayantImage.topAnchor.constraint(equalTo: topImageContainerView.topAnchor, constant: 0),
            kobeBrayantImage.trailingAnchor.constraint(equalTo: topImageContainerView.trailingAnchor, constant: 0),
            kobeBrayantImage.leadingAnchor.constraint(equalTo: topImageContainerView.leadingAnchor, constant: 0),
            kobeBrayantImage.bottomAnchor.constraint(equalTo: topImageContainerView.bottomAnchor, constant: 0),
            
            descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor, constant: 0),
            descriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            descriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5)
            
        ])
        
    
    }
        
    


}

 
