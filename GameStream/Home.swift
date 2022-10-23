//
//  Home.swift
//  GameStream
//
//  Created by Mich DMark on 21/10/22.
//

import SwiftUI

struct Home: View {
    
    @State var tabSeleccionado:Int = 2
    
    var body: some View {
        
        TabView(selection: $tabSeleccionado)
        {
            Text("Pantalla Perfil")
                .font(.system(size: 30, weight: .bold, design: .rounded)).tabItem
                {
                    Image(systemName: "person")
                    Text("Perfil").foregroundColor(.red)
                }.tag(0)

            Text("Pantalla Juegos")
                
                .tabItem
                {
                    Image(systemName: "gamecontroller")
                    Text("Juegos")
                }.tag(1)
            
            PantallaHome()
                .tabItem
                {
                    Image(systemName: "house")
                    Text("Inicio")
                }.tag(2)
            
            Text("Pantalla Favoritos")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem
                {
                    Image(systemName: "heart").background(Color.red)
                    Text("Favoritos")
                }.tag(3)
            
        }.accentColor(.white)
        
        
    }
    
//
//vamos a editar la barra de vistas con UIkit,
//inicializamos, vamos a llamar a tabvar porque es la que esta dentro de UIkit
//este inicializador solo es para decirle que acceda al tab var
//que es de UIkit, no al tabview
    init()
    {
        UITabBar.appearance()
            .backgroundColor = UIColor(Color("TabBar-Color"))
        
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
        
        UITabBar.appearance().isTranslucent = true
        
        //una pequena nota para el area de debug
        print("Iniciando las vistas de home")
            
    }
    
}



struct PantallaHome: View
{
    @State var textoDeBusqueda: String = ""
    var body: some View
    {
        ZStack
        {
            Color("Marine").ignoresSafeArea()
            VStack
            {
                Image("AppLogo").resizable().aspectRatio(contentMode: .fit).frame(width: 250)
                    .padding(.horizontal, 11)
                
                HStack
                {
                    Button(
                        action:{busqueda() } ,
                        label:
                        {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(textoDeBusqueda.isEmpty ?
                                        Color.yellow : Color("Dark-Cian"))
                        })
                    
                    ZStack(alignment: .leading)
                    {
                        if textoDeBusqueda.isEmpty
                        {
                            Text("Buscar un video")
                                .foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0))
                        }
                        
                        TextField("", text: $textoDeBusqueda).foregroundColor(Color("Light-Gray"))
                        
                    }
                    
                    
                    
                }.padding([.top, .leading, .bottom], 11.0)
                    .background(Color("Blue-Gray"))
                    .clipShape(Capsule())
                
                
                
                
            }.padding(.horizontal, 18)
            
            
            
        }.navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
    }
    
    
    func busqueda()
    {
        print("El usuario esta buscando \(textoDeBusqueda)")
    }
}


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}




