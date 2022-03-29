//
//  UITableView+Reusable.swift
//  FunctionalTableData
//
//  Created by Raul Riera on 2017-10-08.
//  Copyright © 2017 Raul Riera. All rights reserved.
//

import UIKit

public extension UITableView {
	// MARK: Headers
	
	final func registerReusableHeaderFooterView<T: UITableViewHeaderFooterView>(_ headerType: T.Type) {
		register(headerType.self, forHeaderFooterViewReuseIdentifier: T.reuseIdentifierFT)
	}
	
	final func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(_ headerType: T.Type = T.self) -> T {
		guard let header = self.dequeueReusableHeaderFooterView(withIdentifier: headerType.reuseIdentifierFT) as? T else {
			fatalError("Failed to dequeue a header/footer with identifier \(headerType.reuseIdentifierFT) matching type \(headerType.self)")
		}
		return header
	}
	
	// MARK: Cells
	
	final func registerReusableCell<T: UITableViewCell>(_ cellType: T.Type) {
		register(cellType.self, forCellReuseIdentifier: T.reuseIdentifierFT)
	}
	
	final func dequeueReusableCell<T: UITableViewCell>(_ cellType: T.Type = T.self, indexPath: IndexPath?) -> T {
		if let indexPath = indexPath {
			guard let cell = self.dequeueReusableCell(withIdentifier: cellType.reuseIdentifierFT, for: indexPath) as? T else {
				fatalError("Failed to dequeue a cell with identifier \(cellType.reuseIdentifierFT) matching type \(cellType.self)")
			}
			return cell
		} else {
			guard let cell = self.dequeueReusableCell(withIdentifier: cellType.reuseIdentifierFT) as? T else {
				fatalError("Failed to dequeue a cell with identifier \(cellType.reuseIdentifierFT) matching type \(cellType.self)")
			}
			return cell
		}
	}
}

extension UITableViewCell: FTReusable { }
extension UITableViewHeaderFooterView: FTReusable { }
