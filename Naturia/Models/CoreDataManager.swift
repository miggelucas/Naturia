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
    
    init(container: NSPersistentContainer = NSPersistentContainer(name: "CoreData2")) {
        self.container = container
        self.container.loadPersistentStores { description, erro in
            if let error = erro {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
    
    func saveDrawn(for drawn: Drawn) async {
        
        let drawnContext = DrawnEntity(context: viewContext)
        
        let render = await ImageRenderer(content: drawn.image)
        guard let userUIImage = await render.uiImage else {
            print("Failed to saveDraw")
            print("Failed to convert drawImage to UIImage")
            return
        }
        
        // Defina os valores dos atributos do objeto gerenciado com base no objeto Drawn
        drawnContext.id = drawn.id
        drawnContext.plantName = drawn.plantName
        drawnContext.creationDate = drawn.creationDate
        drawnContext.imageData = userUIImage.pngData()
        drawnContext.type = drawn.type == .imaginative ? "imaginative" : "observative"
        
        // Salve o contexto do banco de dados para persistir o objeto
        do {
            print(drawnContext.plantName!)
            try viewContext.save()
            print("Salvou!")
        } catch {
            print("Failed to save drawn: \(error.localizedDescription)")
        }
    }
    
    func fetchDrawns(completion: @escaping (Result<[Drawn], Error>) -> Void) {
        let fetchRequest: NSFetchRequest<DrawnEntity> = DrawnEntity.fetchRequest()
        
        var drawnsEntitiesArray: [DrawnEntity] = []
        
        var drawns: [Drawn] {
            drawnsEntitiesArray.map { drawnEntity in
                return Drawn(id: drawnEntity.id!,
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
        
        completion(.success(drawns))
        
        
    }
    
}
