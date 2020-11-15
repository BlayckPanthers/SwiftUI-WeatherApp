//
//  ContentView.swift
//  SwiftUI-WeatherApp
//
//  Created by Fabien Lebon on 15/11/2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .white]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                Text("Paris, FR")
                    .font(.system(size: 32, weight: .medium))
                    .foregroundColor(.white)
                    .padding()
                VStack(spacing: 10) {
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                    
                    Text("32°")
                        .font(.system(size: 70, weight: .medium))
                        .foregroundColor(.white)
                }
                Spacer()
                HStack {
                    ForEach(weathers) { weather in
                        VStack {
                            Text(weather.day)
                            Image(systemName: weather.imageSF)
                                .renderingMode(.original)
                            Text(weather.temp)
                        }
                    }
                }
                Spacer()
            }
            
        }
        
    }
}

let weathers : [Weather] = [
    Weather(day: "TUE", imageSF: "cloud.bolt.rain.fill", temp: "27"),
    Weather(day: "WED", imageSF: "sun.max.fill", temp: "33"),
    Weather(day: "THU", imageSF: "cloud.sun.fill", temp: "31"),
    Weather(day: "FRI", imageSF: "sun.max.fill", temp: "38"),
    Weather(day: "SAT", imageSF: "cloud.sun.bolt.fill", temp: "34")
]

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
