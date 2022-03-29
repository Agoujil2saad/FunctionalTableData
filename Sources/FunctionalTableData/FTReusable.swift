//
//  Reusable.swift
//  FunctionalTableData
//
//  Created by Geoffrey Foster on 2016-09-10.
//  Copyright © 2016 Shopify. All rights reserved.
//

import UIKit

/// A type that identifies a dequeueable object. Used by `FunctionalTableData` to increase performance by reusing objects when it needs to, just like `UITableView` and `UICollectionView`.
public protocol FTReusable: AnyObject {
	/// Unique identifier for the object.
	static var reuseIdentifierFT: String { get }
}

extension FTReusable {
	public static var reuseIdentifierFT: String {
		return NSStringFromClass(self)
	}
}
