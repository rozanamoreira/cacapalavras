require './matriz.rb'

x, y = ARGV

m = Matriz.new(x.to_i,y.to_i)

list_of_countries = [ "Lao", "New", "San", "Sao", "Sri", "Cape", "Chad", "Cook", "Cuba", "East", "Fiji", "Guam", "Hong", "Iran", "Iraq", "Mali", "Niue", "Oman", "Peru", "Togo", "Aruba", "Benin", "Chile", "China", "Cocos", "Congo", "Costa", "Czech", "Egypt", "Faroe", "Gabon", "Ghana", "Haiti", "Heard", "India", "Italy", "Ivory", "Japan", "Kenya", "Korea", "Macau", "Malta", "Nauru", "Nepal", "Niger", "Palau", "Papua", "Qatar", "Saint", "Samoa", "Saudi", "South", "Spain", "Sudan", "Tonga", "Turks", "Yemen", "Zaire", "Angola", "Belize", "Bhutan", "Bosnia", "Bouvet", "Brasil", "Brunei", "Canada", "Cayman", "Cyprus", "France", "French", "Gambia", "Greece", "Guinea", "Guyana", "Israel", "Jordan", "Kuwait", "Latvia", "Libyan", "Malawi", "Mexico", "Monaco", "Norway", "Panama", "Poland", "Puerto", "Rwanda", "Sierra", "Sweden", "Syrian", "Taiwan", "Turkey", "Tuvalu", "Uganda", "United", "Virgin", "Wallis", "Zambia", "Albania", "Algeria", "Andorra", "Antigua", "Armenia&quo t", "Austria", "Bahamas", "Bahrain", "Belarus", "Belgium", "Bermuda", "Bolivia", "British", "Burkina", "Burundi", "Central", "Comoros", "Croatia", "Denmark", "Ecudaor", "Eritrea", "Estonia", "Finland", "Georgia", "Germany", "Grenada", "Hungary", "Iceland", "Ireland", "Jamaica", "Lebanon", "Lesotho", "Liberia", "Mayotte", "Moldova", "Morocco", "Myanmar", "Namibia", "Nigeria", "Norfork", "Reunion", "Romania", "Russian", "Senegal", "Solomon", "Somalia", "Tokelau", "Tunisia", "Ukraine", "Uruguay", "Vanuatu", "Vatican" , "Vietnam", "Virigan", "Western", "American", "Anguilla", "Barbados", "Botswana", "Bulgaria", "Cambodia", "Cameroon", "Colombia", "Djibouti", "Dominica", "Ethiopia", "Falkland", "Honduras", "Kiribati", "Malaysia", "Maldives", "Marshall", "Mongolia", "Northern", "Pakistan", "Paraguay", "Pitcairn", "Portugal", "Slovakia", "Slovenia", "Suriname", "Svalbarn", "Tanzania", "Thailand", "Trinidad", "Zimbabwe", "Argentina", "Australia", "Christmas", "Dominican", "Gibraltar", "Greenland", "Guatemala", "Indonesia", "Lithuania", "Macedonia", "Maurit ius", "Nicaragua", "Singapore", "Swaziland", "Venezuela", "Antarctica", "Azerbaijan", "Bangladesh", "Equatorial", "Guadeloupe", "Kazakhstan", "Kyrgyzstan", "Luxembourg", "Madagascar", "Martinique", "Mauritania", "Micronesia", "Montserrat", "Mozambique", "Seychelles", "Tajikistan", "Uzbekistan", "Yugoslavia", "Afghanistan", "Netherlands", "Philippines", "Switzerland", "Turkmenistan", "Liechtenstein" ]



m.find_all(list_of_countries)




