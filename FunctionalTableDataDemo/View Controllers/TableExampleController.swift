//
//  FirstViewController.swift
//  FunctionalTableDataDemo
//
//  Created by Kevin Barnes on 2018-04-20.
//  Copyright © 2018 Shopify. All rights reserved.
//

import UIKit
import FunctionalTableData

class TableExampleController: UITableViewController {
	private let functionalData = FunctionalTableData()
	private var items: [String] = []
	
	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.isEditing = true
		functionalData.tableView = tableView
		title = "Table View"
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didSelectAdd))
	}
	
	@objc private func didSelectAdd() {
		items.append("\(items.count)")
		render()
	}
	
	private func render() {
		let rows: [CellConfigType] = items.enumerated().map { index, item in
			return LabelCell(
				key: "id-\(item)",
				actions: CellActions(
					selectionAction: { _ in
						print("\(item) selected")
						return .selected
				},
					deselectionAction: { _ in
						print("\(item) deselected")
						return .deselected
				},
					canBeMoved: true
				),
				state: LabelState(text: item),
				cellUpdater: LabelState.updateView)
		}
		
		functionalData.renderAndDiff([
			TableSection(key: "section", rows: rows) { [ weak self] (from, to) in
				if let cell = self?.items.remove(at: from) {
					self?.items.insert(cell, at: to)
					self?.render()
				}
			}
        ])
	}
}

