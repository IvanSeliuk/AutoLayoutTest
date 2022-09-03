//
//  SwipingController.swift
//  AutoLayoutTest
//
//  Created by Иван Селюк on 28.08.22.
//

import UIKit

class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    // UICollectionViewDelegateFlowLayout - размер и расстояние между элементами
    
    let pages = [
    Page(imageName: "Kobe Bryant", headerText: "Kobe Bryant (1978-2020) was one of the most accomplished and celebrated athletes of all time. Over the course of his twenty-year career ― all played with the Los Angeles Lakers ― he won five NBA championships, two Olympic gold medals, eighteen All-Star selections, and four All-Star Game MVP awards, among many other achievements before retiring in 2016.", bodyText: "\n\nHe is Legend!\n R.I.P."),
    Page(imageName: "lebron james", headerText: "LeBron James is an American professional basketball player for the Los Angeles Lakers. He is widely considered one of the greatest players of all time and is often compared to Michael Jordan in debates over the greatest basketball player ever. James has won four NBA championships, four NBA MVP awards, four NBA Finals MVP awards, three All-Star MVP awards, and two Olympic gold medals. James has scored the most points in the playoffs, the second most career points, and has the seventh most career assists. In 2022 he became the first player in NBA history to accumulate 10,000 or more career points, rebounds, and assists.", bodyText: "\n\nNicknamed King James!"),
    Page(imageName: "Staf Curry1", headerText: "Stephen Curry II is an American professional basketball player for the Golden State Warriors. Widely regarded as one of the greatest basketball players of all time, and as the greatest shooter in NBA history, Curry is credited with revolutionizing the sport by inspiring teams and players to shoot far more three-point shots. An eight-time NBA All-Star and eight-time All-NBA selection, including four times on the first team, he has been named the NBA Most Valuable Player (MVP) twice, has won four NBA championships, and received an NBA Finals MVP Award and an NBA All-Star Game MVP Award.", bodyText: "\n\nSniper!")
    ]
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int(x / view.frame.width )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtonControls()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionView.backgroundColor = .black
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: "cellId") //обязательно зарегистрировать ячейку
        collectionView.isPagingEnabled = true
    }
    
    private lazy var previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(UIColor.mainYellow, for: .normal)
        button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        return button
    }()
    
    @objc private func handlePrev() {
        let nextIndex = max(pageControl.currentPage - 1, 0)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    private lazy var nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(UIColor.mainYellow, for: .normal)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    
    @objc private func handleNext() {
        let nextIndex = min(pageControl.currentPage + 1, pages.count - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPage = 0
        pageControl.numberOfPages = pages.count
        pageControl.pageIndicatorTintColor = .mainYellow
        return pageControl
    }()
    
    fileprivate func setupButtonControls() {
        
        let bottomControlsStackView = UIStackView(arrangedSubviews: [previousButton, pageControl, nextButton])
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlsStackView.distribution = .fillEqually
        // bottomControlsStackView.axis = .vertical         //stackView
        view.addSubview(bottomControlsStackView)
        
        NSLayoutConstraint.activate([
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
