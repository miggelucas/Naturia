//
//  CoreDataManager.swift
//  Naturia
//
//  Created by Lucas Migge de Barros on 27/04/23.
//

import Foundation
import CoreData
import UIKit
import SwiftUI

class CoreDataManager {
    
    static var shared = CoreDataManager()
    
    let container: NSPersistentContainer
    
    var viewContext: NSManagedObjectContext {
        container.viewContext
    }
    
    init(container: NSPersistentContainer = NSPersistentContainer(name: "PlantsAndDrawnCD")) {
        self.container = container
        self.container.loadPersistentStores { description, erro in
            if let error = erro {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
    
    func fetchPlants(completionHandler: @escaping (Result<[Plant], Error>) -> Void) {
        let request: NSFetchRequest<PlantCD> = PlantCD.fetchRequest()
        
        var fetchedPlants: [PlantCD] = []
        
        do {
            fetchedPlants = try viewContext.fetch(request)
        } catch {
            completionHandler(.failure(error))
        }
        
        var plants: [Plant] {
            fetchedPlants.map { plantCD in
                return Plant(id: Int(plantCD.id),
                             popularName: plantCD.populaName ?? "plant name",
                             scientificName: plantCD.scientificName ?? "Scientific name",
                             origin: plantCD.origin ?? "",
                             imagePath: plantCD.imagePath ?? "",
                             iconPath: plantCD.iconPath ?? "",
                             description: plantCD.mainDescription ?? "",
                             trivia: plantCD.trivia ?? [])

            }
        }
        
        print("load plants success")
        completionHandler(.success(plants))
        
    }
    
    func savePlant(for plant: Plant, completionHandler: @escaping (Result<String, Error>) -> Void) async {
        let plantContext = PlantCD(context: viewContext)
    
        plantContext.id = Int16(plant.id)
        plantContext.populaName = plant.popularName
        plantContext.scientificName = plant.scientificName
        plantContext.origin = plant.origin
        plantContext.mainDescription = plant.description
        plantContext.imagePath = plant.imagePath
        plantContext.iconPath = plant.iconPath
        plantContext.trivia = plant.trivia
        
        
        do {
            try viewContext.save()
            completionHandler(.success("Planta de ID #\(plant.id) salva com sucesso"))
        } catch {
            completionHandler(.failure(error))

        }
        
        
        
    }
    
//    func saveDrawn(for drawn: Drawn, completion: @escaping (Result<String, Error>) -> Void) async {
//        let drawnContext = DrawnEntity(context: viewContext)
//
//        let render = await ImageRenderer(content: drawn.image)
//
//        if let userUIImage = await render.uiImage  {
//            drawnContext.id = drawn.id
////            drawnContext.journeyId = drawn.journeyId
////            drawnContext.plantName = drawn.plantName
//            drawnContext.creationDate = drawn.creationDate
//            drawnContext.imageData = userUIImage.pngData()
//            drawnContext.type = drawn.type == .imaginative ? "imaginative" : "observative"
//
//            do {
//                print(drawnContext.journeyId!)
//                try viewContext.save()
//                completion(.success("Desenho \(drawnContext.id!) da jornada \(drawnContext.journeyId!) Salvo com sucesso!"))
//            } catch {
//                completion(.failure(error))
//
//            }
//        }
//    }
    
    
    
//    func fetchDrawns(completion: @escaping (Result<[Drawn], Error>) -> Void) {
//        let fetchRequest: NSFetchRequest<DrawnEntity> = DrawnEntity.fetchRequest()
//
//        var drawnsEntitiesArray: [DrawnEntity] = []
//
//        var drawns: [Drawn] {
//            drawnsEntitiesArray.map { drawnEntity in
//                return Drawn(id: drawnEntity.id!,
//                             creationDate: drawnEntity.creationDate!,
//                             image: Image(uiImage: UIImage(data: drawnEntity.imageData!)!),
//                             type: drawnEntity.type == "imaginative" ? .imaginative : .observative)
//            }
//        }
//
//
//        do {
//            drawnsEntitiesArray = try self.viewContext.fetch(fetchRequest)
//        } catch {
//            completion(.failure(error))
//        }
//
//        print("Fetched \(drawnsEntitiesArray.count) drawns in CoreData")
//        completion(.success(drawns))
//
//
//    }
    
}
