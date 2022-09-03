//
//  SwipingController + extension.swift
//  AutoLayoutTest
//
//  Created by Иван Селюк on 3.09.22.
//

import UIKit

extension SwipingController {
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionViewLayout.invalidateLayout() //при повороте экрана(изменении размера) будет недействительным весь макет представления, но все равно с багами. индекс в pageControl
        coordinator.animate(alongsideTransition: { (_) in // небольшая анимация при повороте экрана
            self.collectionViewLayout.invalidateLayout()
            
            if self.pageControl.currentPage == 0 { //при повороте 2 или 3 стр, когда возвращаешься на 1, то она отсутствует. этот if фиксит это
                self.collectionView.contentOffset = .zero
            } else {
                let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)
                self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true) // fix bug for index pageControl
            }
        }) { (_) in 
            
        }
    }
}
