//
//  ContentView.swift
//  MobilApp
//
//  Created by Nisanur Korkmaz on 19/08/2022.


import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MenuContent : View {
    var Items : [Item] = LinkList.MenuItem
    var body : some View{
        ZStack{
            Color(uiColor: .white)
            VStack(alignment: .leading, spacing: 0){
                HStack{
                Image("kou_pin_logo")
                    .resizable()
                    .renderingMode(.original)
                    .frame(width: 185, height: 185, alignment: .center)
                    .background(Color.green)
                    .padding()
                    .padding()
                }
                    .padding()
                    .background(Color.green)
                    .padding(.top)
                    .ignoresSafeArea()
                    Spacer(minLength: 0)

                List(Items, id: \.id){ item in
                    HStack{
                        Image(item.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 32, height: 32, alignment: .center)
                        
                        Link(destination:item.url, label:{
                            Text(item.text)
                            .bold()
                            .multilineTextAlignment(.leading)
                            .font(.system(size: 22))
                            .foregroundColor(Color.black)

                        })
                    }
                    .padding()
                    }
            }
        }
    }
    
}

struct SideMenu: View{
    let width : CGFloat
    let menuOpened : Bool
    let toggleMenu : () -> Void
    
    var body : some View{
        ZStack{
            GeometryReader{ _ in
                EmptyView()
            }
            .background(Color.gray.opacity(0.5))
            .opacity(self.menuOpened ? 1 : 0)
            .animation(Animation.easeIn.delay(0.25))
            .onTapGesture {
                self.toggleMenu()
            }
            HStack{
                MenuContent()
                    .frame(width: width)
                    .offset(x: menuOpened ? 0 : -width)
                    .animation(.default)
                
                Spacer()
            }
        }
    }
}

struct Home : View {
    @State private var selection : String? = nil
    @State var menuOpened = false
    @State var searchText = ""
    var Locations: [Model] = load("characterData.json")
    @State var aramaStringi = ""
    var body : some View{
        ZStack(alignment: .leading){
            if !menuOpened {
        VStack{
            ZStack{
                HStack{
                    Button(action: {
                        self.menuOpened.toggle()
                        menuOpened = true
                    }, label: {
                        Image(systemName: "line.horizontal.3")
                            .font(.system(size: 22))
                            .foregroundColor(.black)
                    })
                    Spacer(minLength: 0)
                    
                    Button(action: {}, label: {
                        Image("kou_pin_logo")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 45, height: 45)
                            .clipShape(Circle())
                    })
                }
                Text("KOCAELi ÜNiVERSiTESi LOKASYONLARI")
                    .font(.title2)
                    .fontWeight(.semibold)
            }
            .padding()
            .padding(.top, 30)
            .background(Color.green)
            VStack{
                Buttons()
            }
        }
        Spacer(minLength: 0)
}
            SideMenu(width : UIScreen.main.bounds.width/1.4,
                     menuOpened : menuOpened ,
                     toggleMenu : toggleMenu )
            
        }
            .ignoresSafeArea(.all, edges: .all)
            Spacer(minLength: 0)
    }
    
    func toggleMenu(){
                menuOpened.toggle()
            }

}
