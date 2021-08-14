//
//  ContatoForm.swift
//  ContatosApp
//
//  Created by IOS SENAC on 8/14/21.
//

import SwiftUI

struct ContatoForm: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

    @State var nome = ""
    @State var telefone = ""
    @State var email = ""
    var body: some View {
        NavigationView{
            Form{
                TextField("nome", text: $nome)
                TextField("Telefone", text: $telefone)
                    .keyboardType(.decimalPad)
                TextField("Email", text: $email)
            }
            .navigationTitle("Novo Contato")
            .navigationBarHidden(false)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Done"){
                        let contato = Contato(nome: nome, telefone: telefone, email: email)
                        ContentView.contatos.append(contato)
                        self.mode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
}

struct ContatoForm_Previews: PreviewProvider {
    static var previews: some View {
        ContatoForm()
    }
}
