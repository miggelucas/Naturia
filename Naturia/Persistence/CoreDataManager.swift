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
    
    init(container: NSPersistentContainer = NSPersistentContainer(name: "CoreData")) {
        self.container = container
        self.container.loadPersistentStores { description, erro in
            if let error = erro {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
    
    func saveDrawn(for drawn: Drawn, completion: @escaping (Result<String, Error>) -> Void) async {
        let drawnContext = DrawnEntity(context: viewContext)
        
        let render = await ImageRenderer(content: drawn.image)
        
        if let userUIImage = await render.uiImage  {
            drawnContext.id = drawn.id
            drawnContext.journeyId = drawn.journeyId
            drawnContext.plantName = drawn.plantName
            drawnContext.creationDate = drawn.creationDate
            drawnContext.imageData = userUIImage.pngData()
            drawnContext.type = drawn.type == .imaginative ? "imaginative" : "observative"
            
            do {
                print(drawnContext.journeyId!)
                try viewContext.save()
                completion(.success("Desenho \(drawnContext.id!) da jornada \(drawnContext.journeyId!) Salvo com sucesso!"))
            } catch {
                completion(.failure(error))

            }
        }
    }
    
    
    
    func fetchDrawns(completion: @escaping (Result<[Drawn], Error>) -> Void) {
        let fetchRequest: NSFetchRequest<DrawnEntity> = DrawnEntity.fetchRequest()
        
        var drawnsEntitiesArray: [DrawnEntity] = []
        
        var drawns: [Drawn] {
            drawnsEntitiesArray.map { drawnEntity in
                return Drawn(id: drawnEntity.id!,
                             journeyId: drawnEntity.journeyId!,
                             plantName: drawnEntity.plantName!,
                             creationDate: drawnEntity.creationDate!,
                             image: Image(uiImage: UIImage(data: drawnEntity.imageData!)!),
                             type: drawnEntity.type == "imaginative" ? .imaginative : .observative)
            }
        }
        
        
        do {
            drawnsEntitiesArray = try self.viewContext.fetch(fetchRequest)
        } catch {
            completion(.failure(error))
        }
        
        print("Fetched \(drawnsEntitiesArray.count) drawns in CoreData")
        completion(.success(drawns))
        
        
    }
    
}
