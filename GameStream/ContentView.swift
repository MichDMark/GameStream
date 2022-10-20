//
//  ContentView.swift
//  GameStream
//
//  Created by Mich DMark on 19/10/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

        ZStack
        {
            Color(red: 18/255, green: 31/255, blue: 61/255).ignoresSafeArea()
            VStack
            {
                Image("AppLogo").resizable().aspectRatio(contentMode: .fit).frame(width: 250)
                
                InicioSesionYRegistro()
            }
        }
    }
}

struct InicioSesionYRegistro: View {
    var body: some View
    {
        VStack
        {
            HStack
            {
                Text("INICIA SESIÓN")
                Text("REGISTRATE")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()

        Image("Pantalla1").resizable().ignoresSafeArea()

    }
}
