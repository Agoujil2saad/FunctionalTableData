//
//  UICollectionView+Reusable.swift
//  FunctionalTableData
//
//  Created by Raul Riera on 2017-09-16.
//  Copyright © 2017 Raul Riera. All rights reserved.
//

import UIKit

public extension UICollectionView {	
	final func registerReusableCell<T: UICollectionViewCell>(_ cellType: T.Type) {
		register(cellType.self, forCellWithReuseIdentifier: T.reuseIdentifierFT)
	}
	
	final func dequeueReusableCell<T: UICollectionViewCell>(_ cellType: T.Type = T.self, indexPath: IndexPath) -> T {
		guard let cell = self.dequeueReusableCell(withReuseIdentifier: cellType.reuseIdentifierFT, for: indexPath) as? T else {
			fatalError("Failed to dequeue a cell with identifier \(cellType.reuseIdentifierFT) matching type \(cellType.self)")
		}
		return cell
	}
	
	func register(viewClass: AnyClass?, forSupplementaryViewOfKind kind: ReusableKind, withReuseIdentifier reuseIdentifier: String) {
		register(viewClass, forSupplementaryViewOfKind: kind.rawValue, withReuseIdentifier: reuseIdentifier)
	}
	
	func dequeueReusableSupplementaryView(ofKind kind: ReusableKind, withReuseIdentifier reuseIdentifier: String, for indexPath: IndexPath) -> UICollectionReusableView {
		return dequeueReusableSupplementaryView(ofKind: kind.rawValue, withReuseIdentifier: reuseIdentifier, for: indexPath)
	}
}

extension UICollectionReusableView: FTReusable { }
