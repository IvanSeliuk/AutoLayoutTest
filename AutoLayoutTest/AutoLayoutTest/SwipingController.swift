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
    Page(imageName: "Staf Curry1", headerText: "Stephen Curry II is an American professional basketball player for the Golden State Warriors. Widely regarded as one of the greatest basketball players of all time, and as the greatest shooter in NBA history, Curry is credited with revolutionizing the sport by inspiring teams and players to shoot far more three-point shots. An eight-time NBA All-Star and eight-time All-NBA selection, including four times on the first team, he has been named the NBA Most Valuable Player (MVP) twice, has won four NBA championships, and received an NBA Finals MVP Award and an NBA All-Star Game MVP Award.", bodyText: "\n\nHe is Sniper!")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .black
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: "cellId") //обязательно зарегистрировать ячейку
        collectionView.isPagingEnabled = true
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageCell
       // cell.backgroundColor = indexPath.item % 2 == 0 ? .red : .purple
        
        let page = pages[indexPath.item]
        cell.page = page
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0 //растояние между ячейками
    }
}
