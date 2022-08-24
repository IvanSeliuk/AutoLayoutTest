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
        textView.text = "Kobe Bryant (1978-2020) was one of the most accomplished and celebrated athletes of all time. Over the course of his twenty-year career―all played with the Los Angeles Lakers―he won five NBA championships, two Olympic gold medals, eighteen All-Star selections, and four All-Star Game MVP awards, among many other achievements before retiring in 2016. He is Legend!"
        textView.textColor = .white
        textView.font = UIFont.systemFont(ofSize: 18)
        textView.textAlignment = .center
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.backgroundColor = .black
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(kobeBrayantImage)
        view.addSubview(descriptionTextView)
        view.backgroundColor = .black
        
        setupLayout()
        
    }
    
    private func setupLayout() {
        view.addConstraints([
            kobeBrayantImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            kobeBrayantImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            kobeBrayantImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            kobeBrayantImage.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 2),
            descriptionTextView.topAnchor.constraint(equalTo: kobeBrayantImage.bottomAnchor, constant: 0),
            descriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            descriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
        
    


}

 
