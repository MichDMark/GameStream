//
//  GamesView.swift
//  GameStream
//
//  Created by Mich DMark on 25/10/22.
//

import SwiftUI

struct GamesView: View {
    
    //
    //con el observedobject accedemos a la informacion de gamesInfo
    // la clase gamesInfo ya tenia este protocolo
    @ObservedObject var todosLosVideojuegos = ViewModel()
    //
    //en la arquitectura MVVM las vistas se comunican con el viewModel
    
    
    var body: some View
    {
        //cuando se ejecuta el texto automatica lo que esta en el onappear se va a mostrar
        Text("Hola desde pantalla de GamesView").navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .onAppear(
                
                perform: {
                    print("primer elemento del json: \(todosLosVideojuegos.gamesInfo[0])")
                    
                    print("titulo del primer video \(todosLosVideojuegos.gamesInfo[0].title)")
                }
                    
            )
    }
}

struct GamesView_Previews: PreviewProvider {
    static var previews: some View {
        GamesView()
    }
}
