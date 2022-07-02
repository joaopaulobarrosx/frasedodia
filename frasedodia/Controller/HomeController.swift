//
//  HomeController.swift
//  frasedodia
//
//  Created by Joao Barros on 02/07/22.
//

import UIKit
import FirebaseCore
import FirebaseMessaging
import FirebaseFirestore

class HomeController: UIViewController {
    
    let db = Firestore.firestore()
    var messages: [Message] = []

    @IBOutlet weak var autorFrase: UILabel!
    @IBOutlet weak var frase: UILabel!
    //    @IBOutlet weak var frase: UILabel!
//    @IBOutlet weak var autorFrase: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadMessages ()
        
    }
    
    func loadMessages() {
        messages = []
        db.collection("frase").getDocuments { [self] querySnapshot, error in
            if let e = error {
                print("There was an issue retrieving data from Firestore. \(e)")

            } else {
                if let snapshotDocuments = querySnapshot?.documents {
                    for doc in snapshotDocuments {
                        let data = doc.data()
                        if let mensagemFirebase = data["mensagem"] as? String, let autorFirebase = data["autor"] as? String {
                            let newMessage = Message(mensagem: mensagemFirebase, autor: autorFirebase)
                            self.messages.append(newMessage)
                            
                            let newMessageString = ("\(newMessage.mensagem) Autor: \(newMessage.autor)")
                            
                            let salve = SalvarListar()
                            
                            salve.salvar(dado: newMessageString) //Colocar um IF para salvar só quando receber uma nova notificação
                            
                            
                            DispatchQueue.main.async {
                                self.frase.text = self.messages[1].mensagem
                                self.autorFrase.text = self.messages[1].autor
                            }
                        }
                    }
                }
            }
        }
    }
}

