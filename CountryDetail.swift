//
//  CountryDetail.swift
//  SwiftUIParsingJSON
//
//  Created by Henry Havens on 8/4/20.
//  Copyright © 2020 Henry Havens. All rights reserved.
//

import SwiftUI

struct CountryDetail: View {
    var country: Country
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(country.country)
                .font(.headline)
            Text(country.code)
                .font(.footnote)
        }
    }
}

/*struct CountryDetail_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetail()
    }
}
*/
