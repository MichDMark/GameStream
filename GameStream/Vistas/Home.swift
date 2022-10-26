//
//  Home.swift
//  GameStream
//
//  Created by Mich DMark on 21/10/22.
//

import SwiftUI
import AVKit

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
            
            

            GamesView()
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
                
                
                ScrollView(showsIndicators: false)
                {
                    SubModuloHome()
                                    
                }
                
            }.padding(.horizontal, 18)
            
            
            
        }.navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            
    }
    
 
    
    
    func busqueda()
    {
        print("El usuario esta buscando \(textoDeBusqueda)")
    }
}


struct SubModuloHome: View
{
    //esta es una url por default, si las demas fallan, muestra esta para que no de error
    @State var urlSeleccionada = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"
    @State var isPlayerActive = false
    
    let urlVideos:[String] = ["https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256671638/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256720061/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256814567/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256705156/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256801252/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256757119/movie480.mp4"]
    
    var body: some View
    {
        
        
        VStack {
            Text("LOS MAS POPULARES").font(.title3)
                .foregroundColor(Color.white)
                .bold()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.top)
            
            ZStack
            {
                Button(
                    action:{
                    urlSeleccionada = urlVideos[0]
                    print("URL: \(urlSeleccionada)")
                    isPlayerActive = true
                },
            label:
                        {
                            VStack(spacing: 0)
                            {
                                Image("The Witcher 3").resizable().scaledToFill()
                                Text("The Witcher 3").frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                                    .background(Color("Blue-Gray"))
                            }
                        })
                
                Image(systemName: "play.circle.fill").resizable()
                    .foregroundColor(Color(.white))
                    .frame(width: 42, height: 42)

                
            }.frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                .padding(.vertical)
            
  
            Text("CATEGORÍAS SUGERIDAS PARA TI").font(.title3)
                .foregroundColor(Color.white)
                .bold()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.top, 20)
            
            ScrollView(.horizontal, showsIndicators: false)
            {
                HStack
                {
                    Button(action: { print("manda a FPS")},
                           label:
                            {
                                ZStack
                                    {
                                        RoundedRectangle(cornerRadius: 8).fill(Color("Blue-Gray"))
                                            .frame(width: 160, height: 90)
                                        
                                        Image("FPS").resizable().scaledToFit()
                                            .frame(width: 42, height: 42)
                                    }
                            })
                    
                    Button(action: { print("manda a RPG")},
                           label:
                            {
                                ZStack
                                    {
                                        RoundedRectangle(cornerRadius: 8).fill(Color("Blue-Gray"))
                                            .frame(width: 160, height: 90)
                                        
                                        Image("RPG").resizable().scaledToFit()
                                            .frame(width: 42, height: 42)
                                    }
                            })
                    
                    Button(action: { print("manda a Open World")},
                           label:
                            {
                                ZStack
                                    {
                                        RoundedRectangle(cornerRadius: 8).fill(Color("Blue-Gray"))
                                            .frame(width: 160, height: 90)
                                        
                                        Image("OpenWorld").resizable().scaledToFit()
                                            .frame(width: 42, height: 42)
                                    }
                            })
                    
                    
        
                }
                
            }
   
            
            Text("RECOMENDADO PARA TI").font(.title3)
                .foregroundColor(Color.white)
                .bold()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.top, 20)
            
            ScrollView(.horizontal, showsIndicators: false)
            {
                   HStack
                 {
                     
                     Button(
                         action:
                             {
                                 urlSeleccionada = urlVideos[1]
                                 print("URL: \(urlSeleccionada)")
                                 isPlayerActive = true
                             },
                         label:
                             {
                                 Image("Abzu").resizable()
                                     .scaledToFit()
                                     .frame(width: 240, height: 135)
                                 
                             })
                     
                     Button(
                         action:
                             {
                                 urlSeleccionada = urlVideos[2]
                                 print("URL: \(urlSeleccionada)")
                                 isPlayerActive = true
                             },
                         label:
                             {
                                 Image("Crash Bandicoot").resizable()
                                     .scaledToFit()
                                     .frame(width: 240, height: 135)
                                 
                             })
                     
                     
                     Button(
                         action:
                             {
                                 urlSeleccionada = urlVideos[3]
                                 print("URL: \(urlSeleccionada)")
                                 isPlayerActive = true
                             },
                         label:
                             {
                                 Image("DEATH STRANDING").resizable()
                                     .scaledToFit()
                                     .frame(width: 240, height: 135)
                                 
                             })
         
                 }
                
                
            }
            
            Text("VIDEOS QUE PODRIAN GUSTARTE").font(.title3)
                .foregroundColor(Color.white)
                .bold()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.top, 20)
            
            ScrollView(.horizontal, showsIndicators: false)
            {
                   HStack
                 {
                     
                     Button(
                         action:
                             {
                                 urlSeleccionada = urlVideos[6]
                                 print("URL: \(urlSeleccionada)")
                                 isPlayerActive = true
                             },
                         label:
                             {
                                 Image("Grand Theft Auto V").resizable()
                                     .scaledToFit()
                                     .frame(width: 240, height: 135)
                                 
                             })
                     
                     Button(
                         action:
                             {
                                 urlSeleccionada = urlVideos[5]
                                 print("URL: \(urlSeleccionada)")
                                 isPlayerActive = true
                             },
                         label:
                             {
                                 Image("Hades").resizable()
                                     .scaledToFit()
                                     .frame(width: 240, height: 135)
                                 
                             })
                     
                     
                     Button(
                         action:
                             {
                                 urlSeleccionada = urlVideos[4]
                                 print("URL: \(urlSeleccionada)")
                                 isPlayerActive = true
                             },
                         label:
                             {
                                 Image("Cuphead").resizable()
                                     .scaledToFit()
                                     .frame(width: 240, height: 135)
                                 
                             })
         
                 }
                
                
            }
            
        }
        
        
        NavigationLink(
            destination: VideoPlayer(player: AVPlayer(url: URL(string: urlSeleccionada)!))
                .frame(width: 400, height: 300),
            isActive: $isPlayerActive,
            label: {EmptyView()})
        
        
    }
}


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}




