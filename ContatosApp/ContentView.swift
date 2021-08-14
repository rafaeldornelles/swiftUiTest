//
//  ContentView.swift
//  ContatosApp
//
//  Created by IOS SENAC on 8/14/21.
//

import SwiftUI

struct ContentView: View {
    static var contatos = [
        Contato(nome: "Rafael", telefone: "99999999", email: "rafafd@hotmail.com"),
        Contato(nome: "Jorge", telefone: "999999999", email: "jorge@email.com"),
        Contato(nome: "Jorge", telefone: "999999999", email: "jorge@email.com"),
        Contato(nome: "Jorge", telefone: "999999999", email: "jorge@email.com"),
        Contato(nome: "Jorge", telefone: "999999999", email: "jorge@email.com"),
        Contato(nome: "Jorge", telefone: "999999999", email: "jorge@email.com"),
        Contato(nome: "Jorge", telefone: "999999999", email: "jorge@email.com"),
        Contato(nome: "Pedro", telefone: "55555555", email: "pedro@gmail.com")
    ]
    var body: some View {
        NavigationView {
            List{
                ForEach(ContentView.contatos, id: \.self){ contato in
                    ContatoItem(contato: contato)
                }
            }
            .navigationBarHidden(/*@START_MENU_TOKEN@*/false/*@END_MENU_TOKEN@*/)
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Contatos")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    NavigationLink(destination: ContatoForm()) {
                        Text("Add")
                    }
                }
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ContatoItem: View{
    var contato:Contato
    var body: some View {
        HStack(spacing: 20){
            Image("person")
                .resizable()
                .frame(width: 75, height: 75)
                .clipped()
                .clipShape(Circle())
            VStack(alignment: .leading, spacing: 3.0){
                Text(self.contato.nome)
                    .font(.headline)
                    .fontWeight(.bold)
                Text(self.contato.telefone)
                    .font(.caption)
                    .foregroundColor(Color.gray)
                Text(self.contato.email)
                    .font(.caption)
                    .foregroundColor(Color.gray)
            }
            
        }
    }
    
    init(contato: Contato) {
        self.contato = contato
    }
}


struct Contato: Hashable{
    let id: UUID
    var nome: String
    var telefone: String
    var email: String
    
    init(nome: String, telefone: String, email: String) {
        self.id = UUID()
        self.nome = nome
        self.telefone = telefone
        self.email = email
    }
}
