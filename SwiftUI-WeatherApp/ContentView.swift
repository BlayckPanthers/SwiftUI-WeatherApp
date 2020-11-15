//
//  ContentView.swift
//  SwiftUI-WeatherApp
//
//  Created by Fabien Lebon on 15/11/2020.
//

import SwiftUI

struct ContentView: View {
    
    @State  private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            
            VStack {
                CityTextView(cityName: "Paris, FR")
                MainWeatherView(isNight: $isNight, temperature: 32)
                HStack(spacing: 20) {
                    ForEach(weathers) { weather in
                        WeatherDaySubView(weather: weather)
                    }
                }
                Spacer()
                Button {
                    isNight.toggle()
                } label : {
                    WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
                }
                Spacer()
            }
            
        }
        
    }
}

let weathers : [Weather] = [
    Weather(day: "TUE", imageSF: "wind", temp: 27),
    Weather(day: "WED", imageSF: "sun.max.fill", temp: 33),
    Weather(day: "THU", imageSF: "cloud.sun.fill", temp: 31),
    Weather(day: "FRI", imageSF: "sun.max.fill", temp: 38),
    Weather(day: "SAT", imageSF: "cloud.sun.bolt.fill", temp: 34)
]

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDaySubView: View {
    
    var weather: Weather
    
    var body: some View {
        VStack {
            Text(weather.day)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            
            Image(systemName: weather.imageSF)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(weather.temp)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight : Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct CityTextView: View {
    var cityName : String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherView: View {
    
    @Binding var isNight   : Bool
    var temperature : Int
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: isNight ? "moon.stars.fill" : "cloud.sun.fill")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }.padding(.bottom, 40)
    }
}

