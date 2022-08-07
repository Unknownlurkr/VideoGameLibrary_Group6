//
//  Games+CoreDataProperties.swift
//  VideoGameLibrary_Group6
//
//  Created by user211750 on 8/7/22.
//
//

import Foundation
import CoreData


extension Games {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Games> {
        return NSFetchRequest<Games>(entityName: "Games")
    }

    @NSManaged public var id: Int32
    @NSManaged public var title: String?
    @NSManaged public var username: String?
    @NSManaged public var genre: String?
    @NSManaged public var rating: Int16
    @NSManaged public var user_id: Int64

}

extension Games : Identifiable {

}
