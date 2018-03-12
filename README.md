# MTCSA

MTCSA provides a ruby interface to the Move to Competitive Street Address Service offered by the USPS allowing dilivery of packages from third party(UPS, FEDEX, DHL) companies to PO Boxes.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mtcsa'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mtcsa

## Usage

### Get the street address of a PO BOX for third party delivery

```
MTCSA.mtcsa_address(30162, 1288)
=> {:address=>"1420 MARTHA BERRY UNIT 1288 ROME GA 30162", :line_1=>"1420 MARTHA BERRY UNIT 1288", :line_2=>"ROME GA 30162 "} 
```

### See if a postal code supports MTCSA

```
MTCSA.mtcsa_eligible?(30162)
=> true 
```

### return MTCSA infomation on a postal code

```
 MTCSA.find_by_zip(30162)
 => [{:zip=>"30162", :zip_class=>"P", :pbsa_no_sec=>true, :pbsa_no_sec_conflict=>false, :pbsa_conflict=>false, :address=>"1420 MARTHA BERRY", :city=>"ROME", :state=>"GA", :range_1=>"B 1-96", :range_2=>"B 101-149", :range_3=>"B 151-156", :range_4=>"B 161-196", :range_5=>"B 201-236", :range_6=>"B 241-289", :range_7=>"B 291-316", :range_8=>"B 321-369", :range_9=>"B 371-395", :range_10=>"E 396-396", :range_11=>"B 401-449", :range_12=>"B 451-475", :range_13=>"E 476-476", :range_14=>"B 481-529", :range_15=>"B 531-555", :range_16=>"E 556-556", :range_17=>"B 561-609", :range_18=>"B 611-635", :range_19=>"E 636-636", :range_20=>"B 641-689", :range_21=>"B 691-715", :range_22=>"E 716-716", :range_23=>"B 721-769", :range_24=>"B 771-795", :range_25=>"E 796-796", :range_26=>"B 801-849", :range_27=>"B 851-875", :range_28=>"E 876-876", :range_29=>"B 881-916", :range_30=>"B 921-995", :range_31=>"E 996-996", :range_32=>"B 1001-1036", :range_33=>"B 1041-1115", :range_34=>"E 1116-1116", :range_35=>"B 1121-1195", :range_36=>"E 1196-1196", :range_37=>"B 1201-1275", :range_38=>"E 1276-1276", :range_39=>"B 1281-1312", :range_40=>"B 1321-1368", :range_41=>"B 1371-1392", :range_42=>"B 1401-1448", :range_43=>"B 1451-1472", :range_44=>"B 1481-1528", :range_45=>"B 1531-1552", :range_46=>"B 1561-1592", :range_47=>"B 1601-1622", :range_48=>"B 1631-1674", :range_49=>"B 1681-1704", :range_50=>"B 1711-1732", :range_51=>"B 1741-1762", :range_52=>"B 1771-1782", :range_53=>"B 1791-1838", :range_54=>"B 1841-1862", :range_55=>"B 1871-1918", :range_56=>"B 1921-1942", :range_57=>"B 1951-1982", :range_58=>"B 5001-5049", :range_59=>"B 5051-5075", :range_60=>"E 5076-5076", :range_61=>"B 5081-5129", :range_62=>"B 5131-5155", :range_63=>"E 5156-5156", :range_64=>"B 5161-5209", :range_65=>"B 5211-5235", :range_66=>"E 5236-5236", :range_67=>"", :range_68=>"", :range_69=>"", :range_70=>"", :range_71=>"", :range_72=>"", :range_73=>"", :range_74=>"", :range_75=>"", :ranges=>["1-96", "101-149", "151-156", "161-196", "201-236", "241-289", "291-316", "321-369", "371-395", "396-396", "401-449", "451-475", "476-476", "481-529", "531-555", "556-556", "561-609", "611-635", "636-636", "641-689", "691-715", "716-716", "721-769", "771-795", "796-796", "801-849", "851-875", "876-876", "881-916", "921-995", "996-996", "1001-1036", "1041-1115", "1116-1116", "1121-1195", "1196-1196", "1201-1275", "1276-1276", "1281-1312", "1321-1368", "1371-1392", "1401-1448", "1451-1472", "1481-1528", "1531-1552", "1561-1592", "1601-1622", "1631-1674", "1681-1704", "1711-1732", "1741-1762", "1771-1782", "1791-1838", "1841-1862", "1871-1918", "1921-1942", "1951-1982", "5001-5049", "5051-5075", "5076-5076", "5081-5129", "5131-5155", "5156-5156", "5161-5209", "5211-5235", "5236-5236"]}] 
```


## Contributing

1. Fork it ( https://github.com/civitium/mtcsa/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
