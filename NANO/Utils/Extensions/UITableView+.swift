//
//  UITableView+.swift
//  NANO
//
//  Created by DwaeWoo on 2023/11/29.
//

import UIKit

extension UITableView {

    /// Returns a reusable table-view cell object for the class that conform to the `ReusableCell` protocol and adds it to the table.
    /// - Parameters:
    ///   - type: `ReusableCell` 프로토콜을 준수하는 Cell 객체 타입.
    ///   - indexPath: The index path specifying the location of the cell. Always specify the index path provided to you by your data source object. This method uses the index path to perform additional configuration based on the cell’s position in the table view.
    /// - Returns: `ReusableCell` 프로토콜의 `reuseIdentifier` 와 연관된 재사용 가능한 Cell 입니다.
    public func dequeueReusableCell<Cell: ReuseIdentifying>(_ type: Cell.Type, for indexPath: IndexPath) -> Cell {
        let cell = self.dequeueReusableCell(withIdentifier: type.reuseIdentifier, for: indexPath)

        guard let reusableCell = cell as? Cell else {
            preconditionFailure("Failed to dequeue cell with '\(Cell.self)'type")
        }

        return reusableCell
    }

}
