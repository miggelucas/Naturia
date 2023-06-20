//
//  DrawnCD+CoreDataProperties.swift
//  Naturia
//
//  Created by Lucas Migge de Barros on 20/06/23.
//
//

import Foundation
import CoreData


extension DrawnCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DrawnCD> {
        return NSFetchRequest<DrawnCD>(entityName: "DrawnCD")
    }

    @NSManaged public var creationDate: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var image: Data?
    @NSManaged public var type: String?
    @NSManaged public var plant: PlantCD?

}

extension DrawnCD : Identifiable {

}
