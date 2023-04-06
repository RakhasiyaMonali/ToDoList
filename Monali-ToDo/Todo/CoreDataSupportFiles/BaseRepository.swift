//
//  BaseRepository.swift
//  Todo
//
//  Created by Monali on 08/04/22.
//

import Foundation

protocol BaseRepository {

    associatedtype T

    func create(record: T) throws
    func getAll() -> [T]?
    func get(byIdentifier id: UUID) -> T?
    func update(record: T) -> Bool
    func delete(byIdentifier id: UUID) -> Bool
}
