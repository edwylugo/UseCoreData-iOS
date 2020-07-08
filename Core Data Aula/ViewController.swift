//
//  ViewController.swift
//  Core Data Aula
//
//  Created by Edwy Lugo on 23/06/20.
//  Copyright © 2020 Edwy Lugo. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        /*Recuperando os dados*/
        //criar uma requisicao
        //let requisicao = NSFetchRequest<NSFetchRequestResult>(entityName: "Usuario")
        let requisicaoProduto = NSFetchRequest<NSFetchRequestResult>(entityName: "Produto")
        
        //Ordernar de A-Z ou Z-A
        let ordenacaoAZ = NSSortDescriptor(key: "descricao", ascending: true)
        //let ordenacaoZA = NSSortDescriptor(key: "preco", ascending: false)
        
        
        //Aplicarfitros
//        let predicate = NSPredicate(format: "descricao == %@", "apple")
//        let predicate = NSPredicate(format: "descricao contains %@", "apple") //primeira letra tem que ser a correta.
//        let predicate = NSPredicate(format: "descricao contains [c] %@", "apple") //Pesquisar items que comecam
//        let predicate = NSPredicate(format: "descricao beginswith [c] %@", "lin") //item que comeca com chave de caracteres
//        let predicate = NSPredicate(format: "preco < %@", "1999")
        
        let filtroDescricao = NSPredicate(format: "descricao contains [c] %@", "apple")
        let filtroPreco = NSPredicate(format: "preco == %@", "1999")
//        let combinacaoFiltro = NSCompoundPredicate(andPredicateWithSubpredicates: [filtroDescricao, filtroPreco])
        let combinacaoFiltro = NSCompoundPredicate(orPredicateWithSubpredicates: [filtroDescricao, filtroPreco])
        
    
        //aplicar filtros criados a requisicao
        requisicaoProduto.sortDescriptors = [ordenacaoAZ]
        requisicaoProduto.predicate = combinacaoFiltro
        

        do {
        //    let usuarios = try context.fetch(requisicao)
            let produtos = try context.fetch(requisicaoProduto)
//            if usuarios.count > 0 {
//                for usuario in usuarios as! [NSManagedObject] {
//                    guard let nomeUsuario = usuario.value(forKey: "nome") else { return }
//                    guard let loginUsuario = usuario.value(forKey: "login") else { return }
//                    guard let senhaUsuario = usuario.value(forKey: "senha") else { return }
//                    guard let idadeUsuario = usuario.value(forKey: "idade") else { return }
//
//                    print(nomeUsuario)
//                    print(loginUsuario)
//                    print(senhaUsuario)
//                    print(idadeUsuario)
//
//                }
//
//            } else {
//            print("Nenhum usuario encontrado")
//            }
            
            if produtos.count > 0 {
                for produto in produtos as! [NSManagedObject] {
                    guard let desc = produto.value(forKey: "descricao") else { return }
                    guard let preco = produto.value(forKey: "preco") else { return }
                    guard let cor = produto.value(forKey: "cor") else { return }
                    

                    print("\(desc) | \(cor) | \(preco)")

                }

            } else {
            print("Nenhum usuario encontrado")
            }
            
            
            
            
            

        } catch {
            print("Erro ao recuperar os usuarios")
        }
        
        
        /*Criar Entidades*/
       /* let usuario = NSEntityDescription.insertNewObject(forEntityName: "Usuario", into: context)
        
        
        //Configura o Objeto
        usuario.setValue("Edwy Lugo", forKey: "nome")
        usuario.setValue(28, forKey: "idade")
        usuario.setValue("edwylugo", forKey: "login")
        usuario.setValue("1234", forKey: "senha")
        
        
        //salvar (persistir os dados)
        do {
            try context.save()
            print("Salvou os dados com sucesso")
        } catch  {
            print("Erro ao salvar os dados")
        }
        
        */
        
        /*
        
        //Produto
        let produto = NSEntityDescription.insertNewObject(forEntityName: "Produto", into: context)
        
        //Configura o Objeto
        produto.setValue("acer aspire 15", forKey: "descricao")
        produto.setValue("branco", forKey: "cor")
        produto.setValue(89.0, forKey: "preco")
        
        //salvar (persistir os dados)
              do {
                  try context.save()
                  print("Salvou os dados com sucesso")
              } catch  {
                  print("Erro ao salvar os dados")
              }
              
         */
              
        
        
    }


}

