////
////  File.swift
////  Report Asset management
////
////  Created by sothea007 on 18/9/24.
////
//
//
//
//import SwiftUI
//let constants = Constants()
//struct Constants {
//    var hasExtendedSafeArea : Bool {
//       return UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.safeAreaInsets.top ?? 0 > 20
//   }
//   var height : CGFloat{
//      return 75 + (hasExtendedSafeArea ? 20 : 0)
//   }
//   let width = UIScreen.main.bounds.width
//}
//extension View {
//    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
//        clipShape( RoundedCorner(radius: radius, corners: corners) )
//    }
//}
//
//struct RoundedCorner: Shape {
//
//    var radius: CGFloat = .infinity
//    var corners: UIRectCorner = .allCorners
//
//    func path(in rect: CGRect) -> Path {
//        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
//        return Path(path.cgPath)
//    }
//}
//struct TabBarBackgroundView : View {
//    var body: some View{
//        HStack(alignment: .bottom,
//               spacing: 0,
//               content: {
//                    LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.4117647059, green: 0.5176470588, blue: 1, alpha: 1)),Color(#colorLiteral(red: 0.1333333333, green: 0.2901960784, blue: 1, alpha: 1))]),
//                                   startPoint: .top,
//                                   endPoint: .bottom)
//                        .frame(width: constants.width,
//                               height: constants.height,
//                               alignment: .bottom)
//                        .cornerRadius(35, corners: [.topLeft, .topRight])
//                .padding(.top,25)
//        })
//    }
//}
//struct RaadialButton : View {
//    let function : ()->Void
//    var body: some View{
//        Button(action: function, label: {
//            Image(systemName: "plus").resizable().frame(width: 25, height: 25, alignment: .center).foregroundColor(.white)
//        }).frame(width: 90, height: 90, alignment: .center)
//        .background(
//            ZStack{
//                Color.white.frame(width: 90, height: 90, alignment: .center)
//                Color(#colorLiteral(red: 0.262745098, green: 0.3921568627, blue: 0.968627451, alpha: 0.3204319234)).frame(width: 77, height: 77, alignment: .center).clipShape(Circle())
//                LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.4117647059, green: 0.5176470588, blue: 1, alpha: 1)),Color(#colorLiteral(red: 0.1333333333, green: 0.2901960784, blue: 1, alpha: 1))]), startPoint: .top, endPoint: .bottom).frame(width: 65, height: 65, alignment: .center).clipShape(Circle())
//            }
//        )
//        .clipShape(Circle())
//        .position(x: UIScreen.main.bounds.width/2, y : 45)
//    }
//}
//
//struct SpecialView : View {
//    var body: some View{
//        Image(systemName: "person").resizable().frame(width: 100, height: 100, alignment: .center)
//    }
//}
//struct FirstTab: View {
//    var body: some View {
//        VStack{
//            Spacer()
//            HStack{
//                Spacer()
//                Text("First View")
//                Spacer()
//            }
//            Spacer()
//        }.background(Color.red).padding(.bottom, -50)
//        .edgesIgnoringSafeArea(.all)
//    }
//}
//struct SecondTab: View {
//    var body: some View {
//        VStack{
//            Spacer()
//            HStack{
//                Spacer()
//                Text("Second View")
//                Spacer()
//            }
//            Spacer()
//        }.background(Color.blue).padding(.bottom, -50)
//        .edgesIgnoringSafeArea(.all)
//    }
//}
//
//struct ContentView1: View {
//    @State var index = -1
//    
//    var body: some View {
//        VStack{
//            Spacer()
//            switch index{
//            case 0 :
//                FirstTab()
//            case 1 :
//                SecondTab()
//            default:
//                SpecialView()
//            }
//            Spacer()
//            ZStack{
//                TabBarBackgroundView()
//                RaadialButton(function: {
//                    index = -1
//                })
//                HStack{
//                    Button(action: {
//                        index = 0
//                    }, label: {
//                        VStack{
//                            Image(systemName: "clock").resizable().frame(width: 25, height: 25, alignment: .center).accentColor(index == 0 ? .black : .white)
//                            Text("Recent").font(.caption)
//                                .accentColor(index == 0 ? .black : .white)
//                        }
//                        .padding(.top, 20)
//                    }).padding(.leading,25)
//                    Spacer()
//                    Button(action: {
//                        index = 1
//                    }, label: {
//                        VStack{
//                            Image(systemName: "gear").resizable().frame(width: 25, height: 25, alignment: .center).accentColor(index == 1 ? .black : .white)
//                            Text("Settings").font(.caption)
//                                .accentColor(index == 1 ? .black : .white)
//                        }
//                        .padding(.top, 20)
//                    }).padding(.trailing,25)
//                }.padding()
//                
//            }
//            .frame(width: UIScreen.main.bounds.width, height: constants.height, alignment: .bottom)
//            
//        }.edgesIgnoringSafeArea(.all)
//    }
//}
//
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView1()
//    }
//}
