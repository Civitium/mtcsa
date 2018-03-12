require "mtcsa/version"

module MTCSA
  class << self
    
    
    def load
      db
    end
    
    def this_file
      File.expand_path(File.dirname(__FILE__))
    end
    
    def db(file= File.join(this_file, 'data', 'MTCSA.TXT'))
      @db ||= begin
        a = File.read(file)
        a = a.split("\r\n")
        output = []
        a[3..a.count].each do |b|
          output.push(parse_row(b))
        end
        output
      end
    end
    
    def mtcsa_list
      db
    end
    
    def mtcsa_eligible?(zip)
      find_by_zip(zip).length > 0
    end 
    
    def find_by_zip(zip_code)
      db.select {|l| l[:zip] == zip_code.to_s }
    end
    
    def mtcsa_address(zip, box)
      a = find_by_zip(zip)
    
      a.each do |b|
        b[:ranges].each do |c| 
          d = c.split("-")
          if box.to_i >= d[0].to_i && box.to_i <= d[1].to_i
            return {
              address: "#{b[:address]} UNIT #{box.to_i} #{b[:city]} #{b[:state]} #{b[:zip]}", 
              line_1: "#{b[:address]} UNIT #{box.to_i}",
              line_2: "#{b[:city]} #{b[:state]} #{b[:zip]}"
            } 
          end
        end
      end
      return nil
    end
    
    def parse_row(row)
      out = {  
        zip: row[0..4],
        zip_class: row[8],
        pbsa_no_sec: handle_boolean(row[14]),
        pbsa_no_sec_conflict: handle_boolean(row[21]),
        pbsa_conflict: handle_boolean(row[32]),
        address: row[39..78].to_s.strip,
        city: row[79..107].to_s.strip,
        state: row[108..109],
        range_1: row[111..131].to_s.strip,
        range_2: row[132..152].to_s.strip,
        range_3: row[153..173].to_s.strip,
        range_4: row[174..194].to_s.strip,
        range_5: row[195..215].to_s.strip,
        range_6: row[216..236].to_s.strip,
        range_7: row[237..257].to_s.strip,
        range_8: row[258..278].to_s.strip,
        range_9: row[279..299].to_s.strip,
        range_10: row[300..320].to_s.strip,
        range_11: row[321..341].to_s.strip,
        range_12: row[342..362].to_s.strip,
        range_13: row[363..383].to_s.strip,
        range_14: row[384..404].to_s.strip,
        range_15: row[405..425].to_s.strip,
        range_16: row[426..446].to_s.strip,
        range_17: row[447..467].to_s.strip,
        range_18: row[468..488].to_s.strip,
        range_19: row[489..509].to_s.strip,
        range_20: row[510..530].to_s.strip,
        range_21: row[531..551].to_s.strip,
        range_22: row[552..572].to_s.strip,
        range_23: row[573..593].to_s.strip,
        range_24: row[594..614].to_s.strip,
        range_25: row[615..635].to_s.strip,
        range_26: row[636..656].to_s.strip,
        range_27: row[657..677].to_s.strip,
        range_28: row[678..698].to_s.strip,
        range_29: row[699..719].to_s.strip,
        range_30: row[720..740].to_s.strip,
        range_31: row[741..761].to_s.strip,
        range_32: row[762..782].to_s.strip,
        range_33: row[783..803].to_s.strip,
        range_34: row[804..824].to_s.strip,
        range_35: row[825..845].to_s.strip,
        range_36: row[846..866].to_s.strip,
        range_37: row[867..887].to_s.strip,
        range_38: row[888..908].to_s.strip,
        range_39: row[909..929].to_s.strip,
        range_40: row[930..950].to_s.strip,
        range_41: row[951..971].to_s.strip,
        range_42: row[972..992].to_s.strip,
        range_43: row[993..1013].to_s.strip,
        range_44: row[1014..1034].to_s.strip,
        range_45: row[1035..1055].to_s.strip,
        range_46: row[1056..1076].to_s.strip,
        range_47: row[1077..1097].to_s.strip,
        range_48: row[1098..1118].to_s.strip,
        range_49: row[1119..1139].to_s.strip,
        range_50: row[1140..1160].to_s.strip,
        range_51: row[1161..1181].to_s.strip,
        range_52: row[1182..1202].to_s.strip,
        range_53: row[1203..1223].to_s.strip,
        range_54: row[1224..1244].to_s.strip,
        range_55: row[1245..1265].to_s.strip,
        range_56: row[1266..1286].to_s.strip,
        range_57: row[1287..1307].to_s.strip,
        range_58: row[1308..1328].to_s.strip,
        range_59: row[1329..1349].to_s.strip,
        range_60: row[1350..1370].to_s.strip,
        range_61: row[1371..1391].to_s.strip,
        range_62: row[1392..1412].to_s.strip,
        range_63: row[1413..1433].to_s.strip,
        range_64: row[1434..1454].to_s.strip,
        range_65: row[1455..1475].to_s.strip,
        range_66: row[1476..1496].to_s.strip,
        range_67: row[1497..1517].to_s.strip,
        range_68: row[1518..1538].to_s.strip,
        range_69: row[1539..1559].to_s.strip,
        range_70: row[1560..1580].to_s.strip,
        range_71: row[1581..1601].to_s.strip,
        range_72: row[1602..1622].to_s.strip,
        range_73: row[1623..1643].to_s.strip,
        range_74: row[1644..1664].to_s.strip,
        range_75: row[1665..1685].to_s.strip,
      }
      
       out[:ranges] =  self.merge_ranges(out)
       
       out
    end
  
    def handle_boolean(a)
      if a == "Y"
        true
      else
        false
      end
    end
  
    def merge_ranges(row)
       a = row.map{|k,v| v.match(/\d*-\d*/).to_s if k.to_s.include?("range_") && v.strip != "" }
       return a.reject{|a| a == nil}
    end
  end
end
