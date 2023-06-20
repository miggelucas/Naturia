//
//  PlantCD+CoreDataProperties.swift
//  Naturia
//
//  Created by Lucas Migge de Barros on 20/06/23.
//
//

import Foundation
import CoreData


extension PlantCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PlantCD> {
        return NSFetchRequest<PlantCD>(entityName: "PlantCD")
    }

    @NSManaged public var iconPath: String?
    @NSManaged public var id: Int16
    @NSManaged public var imagePath: String?
    @NSManaged public var mainDescription: String?
    @NSManaged public var origin: String?
    @NSManaged public var populaName: String?
    @NSManaged public var scientificName: String?
    @NSManaged public var trivia: [String]?
    @NSManaged public var drawns: NSSet?

}

// MARK: Generated accessors for drawns
extension PlantCD {

    @objc(addDrawnsObject:)
    @NSManaged public func addToDrawns(_ value: DrawnCD)

    @objc(removeDrawnsObject:)
    @NSManaged public func removeFromDrawns(_ value: DrawnCD)

    @objc(addDrawns:)
    @NSManaged public func addToDrawns(_ values: NSSet)

    @objc(removeDrawns:)
    @NSManaged public func removeFromDrawns(_ values: NSSet)

}

extension PlantCD : Identifiable {

}
